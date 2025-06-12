import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_medical_records_by_type_usecase.dart';
import 'get_medical_records_state.dart';

class GetMedicalRecordsCubit extends Cubit<GetMedicalRecordsState> {
  final GetMedicalRecordsByTypeUseCase _getMedicalRecordsByTypeUseCase;

  GetMedicalRecordsCubit(this._getMedicalRecordsByTypeUseCase)
      : super(const GetMedicalRecordsInitial());

  Future<void> getMedicalRecordsByType(int recordType) async {
    emit(const GetMedicalRecordsLoading());

    final result = await _getMedicalRecordsByTypeUseCase.call(recordType);

    result.fold(
      (error) => emit(
        GetMedicalRecordsError(
          error.errMessage,
        ),
      ),
      (response) => emit(
        GetMedicalRecordsSuccess(
          response,
        ),
      ),
    );
  }
}
