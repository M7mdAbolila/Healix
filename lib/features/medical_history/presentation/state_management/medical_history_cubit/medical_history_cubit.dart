// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'medical_history_state.dart';

// /// Simplified coordinator cubit for medical history screen
// /// Specific functionality is handled by specialized cubits
// class MedicalHistoryCubit extends Cubit<MedicalHistoryState> {
//   MedicalHistoryCubit() : super(const MedicalHistoryInitial());

//   void selectRecordType(int recordType) {
//     emit(MedicalHistoryRecordTypeSelected(recordType));
//   }

//   void resetSelection() {
//     emit(const MedicalHistoryInitial());
//   }
// }
//   final TextEditingController diseaseNameController = TextEditingController();
//   final TextEditingController supervisedByController = TextEditingController();
//   final TextEditingController lastTimeDiagnosedController =
//       TextEditingController();

//   // Hereditary Disease controllers
//   final TextEditingController familyInfectionSpreadLevelController =
//       TextEditingController();
//   int? riskLevel;

//   // Medicines list
//   final List<MedicineFormData> _medicines = [MedicineFormData()];
//   List<MedicineFormData> get medicines => _medicines;

//   Future<void> addHistoryRecord() async {
//     emit(const MedicalHistoryLoading());

//     final medicines = _buildMedicinesList();

//     final result = await _addHistoryRecordUseCase.call(
//       HistoryRecordEntity(
//         date: dateController.text.isNotEmpty
//             ? DateTime.tryParse(dateController.text)
//             : null,
//         doctorName: doctorNameController.text.isNotEmpty
//             ? doctorNameController.text.trim()
//             : null,
//         speciality: specialityController.text.isNotEmpty
//             ? specialityController.text.trim()
//             : null,
//         clinicName: clinicNameController.text.isNotEmpty
//             ? clinicNameController.text.trim()
//             : null,
//         medicalDiagnoses: medicalDiagnosesController.text.isNotEmpty
//             ? medicalDiagnosesController.text.trim()
//             : null,
//         notes: notesController.text.isNotEmpty
//             ? notesController.text.trim()
//             : null,
//         medicines: medicines,
//         isFirstTime: isFirstTime,
//         medicalHistoryType: medicalHistoryType,
//         scanType: scanTypeController.text.isNotEmpty
//             ? scanTypeController.text.trim()
//             : null,
//         scanName: scanNameController.text.isNotEmpty
//             ? scanNameController.text.trim()
//             : null,
//         facilityName: facilityNameController.text.isNotEmpty
//             ? facilityNameController.text.trim()
//             : null,
//         scannedPart: scannedPartController.text.isNotEmpty
//             ? scannedPartController.text.trim()
//             : null,
//         procedureName: procedureNameController.text.isNotEmpty
//             ? procedureNameController.text.trim()
//             : null,
//         testName: testNameController.text.isNotEmpty
//             ? testNameController.text.trim()
//             : null,
//         logType: logTypeController.text.isNotEmpty
//             ? logTypeController.text.trim()
//             : null,
//         diseaseName: diseaseNameController.text.isNotEmpty
//             ? diseaseNameController.text.trim()
//             : null,
//         supervisedBy: supervisedByController.text.isNotEmpty
//             ? supervisedByController.text.trim()
//             : null,
//         riskLevel: riskLevel,
//         lastTimeDiagnosed: lastTimeDiagnosedController.text.isNotEmpty
//             ? lastTimeDiagnosedController.text.trim()
//             : null,
//         familyInfectionSpreadLevel:
//             familyInfectionSpreadLevelController.text.isNotEmpty
//                 ? familyInfectionSpreadLevelController.text.trim()
//                 : null,
//         allergen: allergenController.text.isNotEmpty
//             ? allergenController.text.trim()
//             : null,
//         allergyStatus: allergyStatus,
//         reactionSeverity: reactionSeverity,
//         files: files,
//       ),
//     );

//     result.fold(
//       (failure) => emit(
//         MedicalHistoryError(failure.errMessage),
//       ),
//       (success) => emit(
//         const AddHistoryRecordSuccess(),
//       ),
//     );
//   }

//   void addMedicine() {
//     _medicines.add(MedicineFormData());
//     emit(
//       MedicinesUpdated(
//         List.from(_medicines),
//       ),
//     );
//   }

//   void removeMedicine(int index) {
//     if (_medicines.length > 1 && index < _medicines.length) {
//       _medicines[index].dispose();
//       _medicines.removeAt(index);
//       emit(
//         MedicinesUpdated(
//           List.from(_medicines),
//         ),
//       );
//     }
//   }

//   void clearAllMedicines() {
//     for (var medicine in _medicines) {
//       medicine.dispose();
//     }
//     _medicines.clear();
//     _medicines.add(MedicineFormData());
//     emit(MedicinesUpdated(List.from(_medicines)));
//   }

//   List<MedicineEntity> _buildMedicinesList() {
//     return _medicines
//         .where((medicine) => medicine.isValid)
//         .map((medicine) => MedicineEntity(
//               medicineName: medicine.medicineNameController.text,
//               frequency: medicine.frequencyController.text,
//               endDate: medicine.calculateDuration(),
//               startDate: medicine.startDateController.text.isNotEmpty
//                   ? DateTime.tryParse(medicine.startDateController.text)
//                   : null,
//             ))
//         .toList();
//   }

//   void clearForm() {
//     files = null;
//     reactionSeverity = null;
//     allergyStatus = null;
//     riskLevel = null;
//     // Clear medical visit specific controllers
//     doctorNameController.clear();
//     specialityController.clear();
//     clinicNameController.clear();
//     medicalDiagnosesController.clear();
//     notesController.clear();
//     // Clear lab test specific controllers
//     testNameController.clear();
//     // Clear X-Ray specific controllers
//     scanTypeController.clear();
//     scanNameController.clear();
//     facilityNameController.clear();
//     scannedPartController.clear();
//     // Clear surgery specific controllers
//     procedureNameController.clear();
//     surgeonNameController.clear();

//     // Clear logs specific controllers
//     logTypeController.clear();
//     logValueController.clear();

//     // Clear allergy specific controllers
//     allergenController.clear();

//     // Clear chronic disease specific controllers
//     diseaseNameController.clear();
//     supervisedByController.clear();
//     lastTimeDiagnosedController.clear();
//     // Clear hereditary disease specific controllers
//     familyInfectionSpreadLevelController.clear();

//     for (var medicine in _medicines) {
//       medicine.clear();
//     }

//     clearAllMedicines();
//   }

//   @override
//   Future<void> close() {
//     dateController.dispose();
//     doctorNameController.dispose();
//     specialityController.dispose();
//     clinicNameController.dispose();
//     medicalDiagnosesController.dispose();
//     notesController.dispose();

//     // Lab Test controllers
//     testNameController.dispose();

//     // X-Ray controllers
//     scanTypeController.dispose();
//     scanNameController.dispose();
//     facilityNameController.dispose();
//     scannedPartController.dispose();

//     // Surgery controllers
//     procedureNameController.dispose();
//     surgeonNameController.dispose();

//     // Logs controllers
//     logTypeController.dispose();
//     logValueController.dispose();

//     // Allergy controllers
//     allergenController.dispose();

//     // Chronic Disease controllers    chronicDateController.dispose();
//     diseaseNameController.dispose();
//     supervisedByController.dispose();
//     lastTimeDiagnosedController.dispose();

//     // Hereditary Disease controllers
//     familyInfectionSpreadLevelController.dispose();

//     // Dispose medicines
//     for (var medicine in _medicines) {
//       medicine.dispose();
//     }

//     return super.close();
//   }
// }
