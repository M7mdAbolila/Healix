import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/history_record_entity.dart';
import '../repositories/medical_history_repository.dart';

class AddHistoryRecordUseCase {
  final MedicalHistoryRepository repository;

  AddHistoryRecordUseCase(this.repository);

  Future<Either<ApiErrorModel, dynamic>> call(
    HistoryRecordEntity historyRecord,
  ) async {
    return await repository.addHistoryRecord(historyRecord);
  }
}
