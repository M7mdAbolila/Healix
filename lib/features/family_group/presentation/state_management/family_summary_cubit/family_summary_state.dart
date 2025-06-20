part of 'family_summary_cubit.dart';

abstract class FamilySummaryState extends Equatable {
  const FamilySummaryState();

  @override
  List<Object?> get props => [];
}

class FamilySummaryInitial extends FamilySummaryState {
  const FamilySummaryInitial();
}

class FamilySummaryLoading extends FamilySummaryState {
  const FamilySummaryLoading();
}

class FamilySummarySuccess extends FamilySummaryState {
  final FamilySummaryEntity summary;

  const FamilySummarySuccess(this.summary);

  @override
  List<Object?> get props => [summary];
}

class FamilySummaryFailure extends FamilySummaryState {
  final String errorMessage;

  const FamilySummaryFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
