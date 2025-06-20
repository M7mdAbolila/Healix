import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/history_record_entity.dart';
import '../repositories/medical_history_repository.dart';

class AddHistoryRecordUseCase {
  final MedicalHistoryRepository _repository;

  AddHistoryRecordUseCase(this._repository);

  Future<Either<ApiErrorModel, dynamic>> call(
    HistoryRecordEntity historyRecord,
  ) async {
    return await _repository.addHistoryRecord(historyRecord);
  }
}
