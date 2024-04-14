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
