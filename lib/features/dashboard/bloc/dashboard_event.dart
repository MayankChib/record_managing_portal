part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class DashboardInitialFechEvent extends DashboardEvent {}

class DashBoardAddEntry extends DashboardEvent {
  final TransactionModel transactionModel;
  DashBoardAddEntry({required this.transactionModel});
}

class DashBoardEditEntry extends DashboardEvent {
  final TransactionModel transactionModel;
  DashBoardEditEntry({required this.transactionModel});
}

class AccountSearch extends DashboardEvent {
  final int uanController;
  AccountSearch({required this.uanController});
}
