import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_medical_records_by_type_usecase.dart';
import 'get_medical_records_state.dart';

class GetMedicalRecordsCubit extends Cubit<GetMedicalRecordsState> {
  final GetMedicalRecordsByTypeUseCase _getMedicalRecordsByTypeUseCase;

  GetMedicalRecordsCubit({
    required GetMedicalRecordsByTypeUseCase getMedicalRecordsByTypeUseCase,
  })  : _getMedicalRecordsByTypeUseCase = getMedicalRecordsByTypeUseCase,
        super(const GetMedicalRecordsInitial());

  Future<void> getMedicalRecordsByType(int recordType) async {
    emit(const GetMedicalRecordsLoading());

    try {
      final result = await _getMedicalRecordsByTypeUseCase.call(recordType);

      result.fold(
        (error) => emit(GetMedicalRecordsError(error.errMessage)),
        (response) => emit(GetMedicalRecordsSuccess(response)),
      );
    } catch (e) {
      emit(GetMedicalRecordsError(
          'An unexpected error occurred: ${e.toString()}'));
    }
  }
}
