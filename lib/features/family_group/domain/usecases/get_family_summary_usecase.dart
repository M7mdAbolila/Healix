import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/family_summary_request_entity.dart';
import '../entities/family_summary_entity.dart';
import '../repositories/family_group_repository.dart';

class GetFamilySummaryUseCase {
  final FamilyGroupRepository repository;

  GetFamilySummaryUseCase(this.repository);

  Future<Either<ApiErrorModel, FamilySummaryEntity>> call(
    FamilySummaryRequestEntity request,
  ) async {
    return await repository.getFamilySummary(request);
  }
}
