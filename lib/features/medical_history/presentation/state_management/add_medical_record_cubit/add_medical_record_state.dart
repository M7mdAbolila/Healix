part of 'add_medical_record_cubit.dart';

abstract class AddMedicalRecordState extends Equatable {
  const AddMedicalRecordState();

  @override
  List<Object?> get props => [];
}

class AddMedicalRecordInitial extends AddMedicalRecordState {
  const AddMedicalRecordInitial();
}

class AddMedicalRecordLoading extends AddMedicalRecordState {
  const AddMedicalRecordLoading();
}

class AddMedicalRecordSuccess extends AddMedicalRecordState {
  const AddMedicalRecordSuccess();
}

class AddMedicalRecordFailure extends AddMedicalRecordState {
  final String message;

  const AddMedicalRecordFailure(this.message);

  @override
  List<Object> get props => [message];
}

class AddMedicalRecordMedicineListUpdated extends AddMedicalRecordState {
  final List<MedicineFormManager> medicines;

  const AddMedicalRecordMedicineListUpdated(this.medicines);

  @override
  List<Object> get props => [medicines];
}
