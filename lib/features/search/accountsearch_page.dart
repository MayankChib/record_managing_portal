import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_record_magering_portal/features/dashboard/bloc/dashboard_bloc.dart';

class AccountSeachpage extends StatefulWidget {
  final DashboardBloc dashboardBloc;
  const AccountSeachpage({Key? key, required this.dashboardBloc})
      : super(key: key);

  @override
  State<AccountSeachpage> createState() => _AccountSearchPageState();
}

class _AccountSearchPageState extends State<AccountSeachpage> {
  final TextEditingController uanController = TextEditingController();

  String firstName = '';
  String lastName = '';
  String fathername = '';
  String dob = '';
  String gender = '';
  String bloodType = '';
  String mobileNumber = '';
  String maritalStatus = '';
  String pwd = '';
  String category = '';
  String minority = '';
  String identityType = '';
  String identityNumber = '';
  String permanentlocality = '';
  String permanentstate = '';
  String permanentcity = '';
  String permanentdistrict = '';
  String permanentpincode = '';
  String currentlocality = '';
  String currentstate = '';
  String currentcity = '';
  String currentdistrict = '';
  String currentpincode = '';
  String workingoccupation = '';
  String workingmobileNumber = '';
  String workingstate = '';
  String workingcity = '';

  @override
  void dispose() {
    uanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        widget.dashboardBloc.add(DashboardInitialFechEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Search Account Details")),
        body: BlocConsumer<DashboardBloc, DashboardState>(
          bloc: widget.dashboardBloc,
          listener: (context, state) {
            if (state is AccountSearchSuccess) {
              setState(() {});
              _showExtractedValues(
                  state.personalDetails,
                  state.personalSubDetails,
                  state.permanentAddress,
                  state.currentAddress,
                  state.workindDetails);
            }
            if (state is AccountErrorState) {
              _showErrorDialog(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: uanController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Universal Account Number",
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        if (uanController.text.isEmpty) {
                          _showInErrorDialog(context);
                        } else {
                          widget.dashboardBloc.add(AccountSearch(
                              uanController: int.parse(uanController.text)));
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Display first name if available
                    if (state is AccountSearchSuccess)
                      Column(
                        children: [
                          //===================================================
                          const SizedBox(height: 20),
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text("Personal Details",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40)),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                ),
                                child: Center(
                                  child: Text(
                                      style: const TextStyle(fontSize: 30),
                                      "Labour Card Number: ${uanController.text}"),
                                ),
                              )),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                                    border: Border.all(
                                        color: Colors.black, width: 2),
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
                                    border: Border.all(
                                        color: Colors.black, width: 2),
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
                                    border: Border.all(
                                        color: Colors.black, width: 2),
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
                                    border: Border.all(
                                        color: Colors.black, width: 2),
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
                                    border: Border.all(
                                        color: Colors.black, width: 2),
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
                                    border: Border.all(
                                        color: Colors.black, width: 2),
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
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                  ),
                                  child: Center(
                                    child: Text(
                                        style: const TextStyle(fontSize: 30),
                                        "PWd: $pwd"),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.black, width: 2),
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
                                    border: Border.all(
                                        color: Colors.black, width: 2),
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
                                    border: Border.all(
                                        color: Colors.black, width: 2),
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
                                    border: Border.all(
                                        color: Colors.black, width: 2),
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
                                    border: Border.all(
                                        color: Colors.black, width: 2),
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
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40)),
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                            style:
                                                const TextStyle(fontSize: 30),
                                            "Locality: $permanentlocality"),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                            style:
                                                const TextStyle(fontSize: 30),
                                            "State: $permanentstate"),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                            style:
                                                const TextStyle(fontSize: 30),
                                            "City: $permanentcity"),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                            style:
                                                const TextStyle(fontSize: 30),
                                            "District: $permanentdistrict"),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                            style:
                                                const TextStyle(fontSize: 30),
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
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40)),
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                            style:
                                                const TextStyle(fontSize: 30),
                                            "Locality: $currentlocality"),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                            style:
                                                const TextStyle(fontSize: 30),
                                            "State: $currentstate"),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                            style:
                                                const TextStyle(fontSize: 30),
                                            "City: $currentcity"),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                            style:
                                                const TextStyle(fontSize: 30),
                                            "District: $currentdistrict"),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                            style:
                                                const TextStyle(fontSize: 30),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40)),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                      )
                    // if (state is AccountSearchSuccess)
                    //   Text(state.personalDetails),
                    // if (state is AccountSearchSuccess)
                    //   Text(state.personalSubDetails),
                    // if (state is AccountSearchSuccess)
                    //   Text(state.permanentAddress),
                    // if (state is AccountSearchSuccess) Text(state.currentAddress),
                    // if (state is AccountSearchSuccess) Text(state.workindDetails),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showInErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("Please fill in Universal Account Number field"),
          actions: <Widget>[
            TextButton(
              child: const Text("Okay"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Please Try Again"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("Okay"),
              onPressed: () {
                // Dismiss the dialog and navigate back to the previous screen
                Navigator.pop(context);
                // Navigate back to the previous screen
              },
            )
          ],
        );
      },
    );
  }

  void _showExtractedValues(String personalDetails, String personalSubDetails,
      String permanentAddress, String currentAddress, String workindDetails) {
    // Split the details by comma
    List<String> _personalDetails = personalDetails.split(';');
    List<String> _personalSubDetails = personalSubDetails.split(';');
    List<String> _permanentAddress = permanentAddress.split(';');
    List<String> _currentAddress = currentAddress.split(';');
    List<String> _workindDetails = workindDetails.split(';');

    // Initialize variables to store extracted values
    firstName = '';
    lastName = '';
    fathername = '';
    dob = '';
    gender = '';
    bloodType = '';
    mobileNumber = '';
    pwd = '';
    maritalStatus = '';
    category = '';
    minority = '';
    identityType = '';
    identityNumber = '';
    permanentlocality = '';
    permanentstate = '';
    permanentcity = '';
    permanentdistrict = '';
    permanentpincode = '';
    currentlocality = '';
    currentstate = '';
    currentcity = '';
    currentdistrict = '';
    currentpincode = '';
    workingoccupation = '';
    workingmobileNumber = '';
    workingstate = '';
    workingcity = '';

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
}
