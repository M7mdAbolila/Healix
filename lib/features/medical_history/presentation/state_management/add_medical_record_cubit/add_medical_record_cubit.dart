import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';
import '../../../../../core/domain/services/input_validation_service.dart';
import '../../../domain/entities/history_record_entity.dart';
import '../../../domain/entities/medicine_entity.dart';
import '../../../domain/usecases/add_history_record_usecase.dart';
import '../../form_managers/medicine_form_manager.dart';

part 'add_medical_record_state.dart';

class AddMedicalRecordCubit extends Cubit<AddMedicalRecordState> {
  final AddHistoryRecordUseCase _addHistoryRecordUseCase;
  final InputValidationService _validationService;

  AddMedicalRecordCubit({
    required AddHistoryRecordUseCase addHistoryRecordUseCase,
    required InputValidationService validationService,
  })  : _addHistoryRecordUseCase = addHistoryRecordUseCase,
        _validationService = validationService,
        super(const AddMedicalRecordInitial());

  int? _medicalHistoryType;
  List<File>? _files;
  final List<MedicineFormManager> _medicines = [MedicineFormManager()];

  int? get medicalHistoryType => _medicalHistoryType;
  List<File>? get files => _files;
  List<MedicineFormManager> get medicines => _medicines;

  void setMedicalHistoryType(int? type) {
    _medicalHistoryType = type;
  }

  void setFiles(List<File>? files) {
    _files = files;
  }

  void addMedicine() {
    _medicines.add(MedicineFormManager());
    emit(AddMedicalRecordMedicineListUpdated(List.from(_medicines)));
  }

  void removeMedicine(int index) {
    if (_medicines.length > 1 && index < _medicines.length) {
      _medicines[index].dispose();
      _medicines.removeAt(index);
      emit(AddMedicalRecordMedicineListUpdated(List.from(_medicines)));
    }
  }

  String? validateRequiredField(String? value, String fieldName) {
    return _validationService.validateRequiredField(value, fieldName);
  }

  String? validateDate(String? value) {
    if (value == null || value.isEmpty) return null;
    try {
      DateTime.parse(value);
      return null;
    } catch (e) {
      return 'Please enter a valid date';
    }
  }

  Future<void> addMedicalRecord(HistoryRecordEntity record) async {
    if (_medicalHistoryType == null) {
      emit(const AddMedicalRecordFailure(
          'Please select a medical history type'));
      return;
    }

    emit(const AddMedicalRecordLoading());

    try {
      final medicines = _buildMedicinesList();
      final recordWithType = HistoryRecordEntity(
        date: record.date,
        doctorName: record.doctorName?.trim(),
        speciality: record.speciality?.trim(),
        clinicName: record.clinicName?.trim(),
        medicalDiagnoses: record.medicalDiagnoses?.trim(),
        notes: record.notes?.trim(),
        medicines: medicines,
        isFirstTime: record.isFirstTime,
        medicalHistoryType: _medicalHistoryType,
        scanType: record.scanType?.trim(),
        scanName: record.scanName?.trim(),
        facilityName: record.facilityName?.trim(),
        scannedPart: record.scannedPart?.trim(),
        procedureName: record.procedureName?.trim(),
        logType: record.logType?.trim(),
        allergen: record.allergen?.trim(),
        allergyStatus: record.allergyStatus,
        reactionSeverity: record.reactionSeverity,
        diseaseName: record.diseaseName?.trim(),
        supervisedBy: record.supervisedBy?.trim(),
        lastTimeDiagnosed: record.lastTimeDiagnosed,
        familyInfectionSpreadLevel: record.familyInfectionSpreadLevel?.trim(),
        riskLevel: record.riskLevel,
        testName: record.testName?.trim(),
      );

      final result = await _addHistoryRecordUseCase.call(recordWithType);

      result.fold(
        (error) => emit(AddMedicalRecordFailure(error.errMessage)),
        (response) => emit(const AddMedicalRecordSuccess()),
      );
    } catch (e) {
      emit(AddMedicalRecordFailure(
          'An unexpected error occurred: ${e.toString()}'));
    }
  }

  List<MedicineEntity> _buildMedicinesList() {
    return _medicines
        .where((medicine) => medicine.isValid)
        .map((medicine) => MedicineEntity(
              medicineName: medicine.medicineNameController.text.trim(),
              frequency: medicine.frequencyController.text.trim(),
              endDate: medicine.endDateController.text.isNotEmpty
                  ? medicine.endDateController.text
                  : null,
              startDate: medicine.startDateController.text.isNotEmpty
                  ? DateTime.tryParse(medicine.startDateController.text)
                  : null,
            ))
        .toList();
  }

  void clearMedicines() {
    for (var medicine in _medicines) {
      medicine.dispose();
    }
    _medicines.clear();
    _medicines.add(MedicineFormManager());
    emit(AddMedicalRecordMedicineListUpdated(List.from(_medicines)));
  }

  @override
  Future<void> close() {
    for (var medicine in _medicines) {
      medicine.dispose();
    }
    return super.close();
  }
}
