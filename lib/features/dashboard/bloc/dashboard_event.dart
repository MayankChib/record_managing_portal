part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class DashboardInitialFechEvent extends DashboardEvent {}

class DashBoardAddEntry extends DashboardEvent {
  final TransactionModel transactionModel;

  DashBoardAddEntry({required this.transactionModel});
}
