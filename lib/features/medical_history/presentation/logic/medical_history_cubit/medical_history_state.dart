import 'package:equatable/equatable.dart';
import '../medicine_form_data.dart';

abstract class MedicalHistoryState extends Equatable {
  const MedicalHistoryState();

  @override
  List<Object?> get props => [];
}

class MedicalHistoryInitial extends MedicalHistoryState {
  const MedicalHistoryInitial();
}

class MedicalHistoryLoading extends MedicalHistoryState {
  const MedicalHistoryLoading();
}

class AddHistoryRecordSuccess extends MedicalHistoryState {
  const AddHistoryRecordSuccess();
}

class MedicalHistoryError extends MedicalHistoryState {
  final String errMessage;

  const MedicalHistoryError(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}

class MedicinesUpdated extends MedicalHistoryState {
  final List<MedicineFormData> medicines;

  const MedicinesUpdated(this.medicines);

  @override
  List<Object?> get props => [medicines];
}
