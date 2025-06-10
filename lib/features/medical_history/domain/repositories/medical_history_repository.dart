import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/history_record_entity.dart';

abstract class MedicalHistoryRepository {
  Future<Either<ApiErrorModel, dynamic>> addHistoryRecord(
    HistoryRecordEntity historyRecord,
  );
}
