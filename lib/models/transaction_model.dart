//model to define the transactions

class TransactionModel {
  final String address;
  final DateTime timestamp;
  final int UAN;
  final String firstname;
  final String lastname;

  TransactionModel(
      this.address, this.timestamp, this.UAN, this.firstname, this.lastname);
}
