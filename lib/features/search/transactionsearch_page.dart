import 'package:flutter/material.dart';
import 'package:flutter_record_magering_portal/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_record_magering_portal/models/transaction_model.dart';

class TransactionDetailsPage extends StatefulWidget {
  final TransactionModel transaction;
  final DashboardBloc dashboardBloc;
  final int transactionNumber;

  const TransactionDetailsPage({
    required this.transaction,
    required this.dashboardBloc,
    required this.transactionNumber,
  });

  @override
  State<TransactionDetailsPage> createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {
  late String firstName;
  late String lastName;
  late String fathername;
  late String dob;
  late String gender;
  late String bloodType;
  late String mobileNumber;
  late String pwd;
  late String maritalStatus;
  late String category;
  late String minority;
  late String identityType;
  late String identityNumber;
  late String permanentlocality;
  late String permanentstate;
  late String permanentcity;
  late String permanentdistrict;
  late String permanentpincode;
  late String currentlocality;
  late String currentstate;
  late String currentcity;
  late String currentdistrict;
  late String currentpincode;
  late String workingoccupation;
  late String workingmobileNumber;
  late String workingstate;
  late String workingcity;

  @override
  void initState() {
    super.initState();
    _showExtractedValues(
      widget.transaction.personalDetails,
      widget.transaction.personalSubDetails,
      widget.transaction.permanentAddress,
      widget.transaction.currentAddress,
      widget.transaction.workingDetails,
    );
  }

  void _showExtractedValues(String personalDetails, String personalSubDetails,
      String permanentAddress, String currentAddress, String workindDetails) {
    List<String> _personalDetails = personalDetails.split(';');
    List<String> _personalSubDetails = personalSubDetails.split(';');
    List<String> _permanentAddress = permanentAddress.split(';');
    List<String> _currentAddress = currentAddress.split(';');
    List<String> _workindDetails = workindDetails.split(';');

    // Your existing extraction logic here...
    // Extract the key-value pairs from each part
    for (String part in _personalDetails) {
      // Split the part by colon
      List<String> keyValue = part.trim().split(':');
      if (keyValue.length == 2) {
        String key = keyValue[0].trim();
        String value = keyValue[1].trim();
        // Assign values to corresponding variables
        switch (key) {
          case 'First Name':
            firstName = value;
            break;
          case 'Last Name':
            lastName = value;
            break;
          case 'Father Name':
            fathername = value;
            break;
          case 'Date of Birth':
            dob = value;
            break;
          case 'Gender':
            gender = value;
            break;
          case 'Blood Type':
            bloodType = value;
            break;
          case 'Mobile Number':
            mobileNumber = value;
            break;
          default:
            // Handle unknown key
            break;
        }
      }
    }

    for (String part in _personalSubDetails) {
      // Split the part by colon
      List<String> keyValue = part.trim().split(':');
      if (keyValue.length == 2) {
        String key = keyValue[0].trim();
        String value = keyValue[1].trim();
        // Assign values to corresponding variables
        switch (key) {
          case 'Pwd':
            pwd = value;
            break;
          case 'Category':
            category = value;
            break;
          case 'Minority':
            minority = value;
            break;
          case 'Marital Status':
            maritalStatus = value;
            break;
          case 'Identity Type':
            identityType = value;
            break;
          case 'Identity Number':
            identityNumber = value;
            break;
          default:
            // Handle unknown key
            break;
        }
      }
    }

    for (String part in _permanentAddress) {
      // Split the part by colon
      List<String> keyValue = part.trim().split(':');
      if (keyValue.length == 2) {
        String key = keyValue[0].trim();
        String value = keyValue[1].trim();
        // Assign values to corresponding variables
        switch (key) {
          case 'Locality':
            permanentlocality = value;
            break;
          case 'State':
            permanentstate = value;
            break;
          case 'City':
            permanentcity = value;
            break;
          case 'District':
            permanentdistrict = value;
            break;
          case 'Pincode':
            permanentpincode = value;
            break;
          default:
            // Handle unknown key
            break;
        }
      }
    }

    for (String part in _currentAddress) {
      // Split the part by colon
      List<String> keyValue = part.trim().split(':');
      if (keyValue.length == 2) {
        String key = keyValue[0].trim();
        String value = keyValue[1].trim();
        // Assign values to corresponding variables
        switch (key) {
          case 'Locality':
            currentlocality = value;
            break;
          case 'State':
            currentstate = value;
            break;
          case 'City':
            currentcity = value;
            break;
          case 'District':
            currentdistrict = value;
            break;
          case 'Pincode':
            currentpincode = value;
            break;
          default:
            // Handle unknown key
            break;
        }
      }
    }

    for (String part in _workindDetails) {
      // Split the part by colon
      List<String> keyValue = part.trim().split(':');
      if (keyValue.length == 2) {
        String key = keyValue[0].trim();
        String value = keyValue[1].trim();
        // Assign values to corresponding variables
        switch (key) {
          case 'Occupation':
            workingoccupation = value;
            break;
          case 'State':
            workingstate = value;
            break;
          case 'City':
            workingcity = value;
            break;
          case 'MobileNumber':
            workingmobileNumber = value;
            break;
          default:
            // Handle unknown key
            break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Number: ${widget.transactionNumber}'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text('Account: ${widget.transaction.address}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35))),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                            'Date: ${widget.transaction.timestamp.toString().substring(0, 11)}',
                            style: const TextStyle(fontSize: 35)),
                        const SizedBox(height: 30),
                        Text(
                            'Time: ${widget.transaction.timestamp.toString().substring(11, 19)}',
                            style: const TextStyle(fontSize: 35)),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.topLeft,
                child: const Text("Personal Details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Center(
                      child: Text(
                          style: const TextStyle(fontSize: 30),
                          "Labour Card Number: ${widget.transaction.UAN}"),
                    ),
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Center(
                      child: Text(
                          style: const TextStyle(fontSize: 30),
                          "Mobile Number: $mobileNumber"),
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                            style: const TextStyle(fontSize: 30),
                            "First Name: $firstName"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                            style: const TextStyle(fontSize: 30),
                            "Last Name: $lastName"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                            style: const TextStyle(fontSize: 30),
                            "Father Name: $fathername"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                            style: const TextStyle(fontSize: 30),
                            "Date of Birth: $dob"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                            style: const TextStyle(fontSize: 30),
                            "Gender: $gender"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                            style: const TextStyle(fontSize: 30),
                            "Blood Type: $bloodType"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                            style: const TextStyle(fontSize: 30), "PWd: $pwd"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                            style: const TextStyle(fontSize: 30),
                            "Category: $category"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                            style: const TextStyle(fontSize: 30),
                            "Minority: $minority"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                            style: const TextStyle(fontSize: 30),
                            "Marital Status: $maritalStatus"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                            style: const TextStyle(fontSize: 30),
                            "Identity Type: $identityType"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                            style: const TextStyle(fontSize: 30),
                            "Identity Number: $identityNumber"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text("Permanent Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40)),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                                style: const TextStyle(fontSize: 30),
                                "Locality: $permanentlocality"),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                                style: const TextStyle(fontSize: 30),
                                "State: $permanentstate"),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                                style: const TextStyle(fontSize: 30),
                                "City: $permanentcity"),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                                style: const TextStyle(fontSize: 30),
                                "District: $permanentdistrict"),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                                style: const TextStyle(fontSize: 30),
                                "Pincode: $permanentpincode"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text("Current Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40)),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                                style: const TextStyle(fontSize: 30),
                                "Locality: $currentlocality"),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                                style: const TextStyle(fontSize: 30),
                                "State: $currentstate"),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                                style: const TextStyle(fontSize: 30),
                                "City: $currentcity"),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                                style: const TextStyle(fontSize: 30),
                                "District: $currentdistrict"),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                                style: const TextStyle(fontSize: 30),
                                "Pincode: $currentpincode"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.topLeft,
                child: const Text("Working Details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Center(
                      child: Text(
                          style: const TextStyle(fontSize: 30),
                          "Occupation: $workingoccupation"),
                    ),
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Center(
                      child: Text(
                          style: const TextStyle(fontSize: 30),
                          "Mobile Number: $workingmobileNumber"),
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Center(
                      child: Text(
                          style: const TextStyle(fontSize: 30),
                          "State: $workingstate"),
                    ),
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Center(
                      child: Text(
                          style: const TextStyle(fontSize: 30),
                          "City: $workingcity"),
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
