//model to define the transactions

class TransactionModel {
  final String address;
  final DateTime timestamp;
  final int UAN;
  final String personalDetails;
  final String personalSubDetails;
  final String permanentAddress;
  final String currentAddress;
  final String workingDetails;

  TransactionModel(
    this.address,
    this.timestamp,
    this.UAN,
    this.personalDetails,
    this.personalSubDetails,
    this.permanentAddress,
    this.currentAddress,
    this.workingDetails,
  );
}
