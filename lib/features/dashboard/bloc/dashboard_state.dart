part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

class DashBoardLoadingState extends DashboardState {}

class DashBoardErrorState extends DashboardState {}

class DashBoardSuccessState extends DashboardState {
  final List<TransactionModel> transactions;
  DashBoardSuccessState({required this.transactions});
}

class EntrySuccessState extends DashboardState {}

class EntryErrorState extends DashboardState {
  final String errorMessage;
  EntryErrorState({required this.errorMessage});
}

class EditSuccessState extends DashboardState {}

class EditErrorState extends DashboardState {
  final String errorMessage;
  EditErrorState({required this.errorMessage});
}

class AccountSearchSuccess extends DashboardState {
  final String personalDetails;
  final String personalSubDetails;
  final String permanentAddress;
  final String currentAddress;
  final String workindDetails;

  AccountSearchSuccess(
      {required this.personalDetails,
      required this.personalSubDetails,
      required this.permanentAddress,
      required this.currentAddress,
      required this.workindDetails});
}

class AccountErrorState extends DashboardState {
  final String errorMessage;

  AccountErrorState({required this.errorMessage});
}
