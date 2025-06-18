import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/get_family_summary_usecase.dart';
import '../../../domain/entities/family_summary_request_entity.dart';
import '../../../domain/entities/family_summary_entity.dart';

part 'family_summary_state.dart';

class FamilySummaryCubit extends Cubit<FamilySummaryState> {
  final GetFamilySummaryUseCase _getFamilySummaryUseCase;

  FamilySummaryCubit({
    required GetFamilySummaryUseCase getFamilySummaryUseCase,
  })  : _getFamilySummaryUseCase = getFamilySummaryUseCase,
        super(const FamilySummaryInitial());

  Future<void> getFamilySummary(String familyId) async {
    emit(const FamilySummaryLoading());

    try {
      final result = await _getFamilySummaryUseCase.call(
        FamilySummaryRequestEntity(familyId: familyId),
      );

      result.fold(
        (error) => emit(FamilySummaryFailure(error.errMessage)),
        (summary) => emit(FamilySummarySuccess(summary)),
      );
    } catch (e) {
      emit(const FamilySummaryFailure(
          'An unexpected error occurred. Please try again.'));
    }
  }
}
