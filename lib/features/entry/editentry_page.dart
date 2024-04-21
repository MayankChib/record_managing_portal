import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_record_magering_portal/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_record_magering_portal/models/transaction_model.dart';

class EditEntryPage extends StatefulWidget {
  final DashboardBloc dashboardBloc;
  const EditEntryPage({Key? key, required this.dashboardBloc})
      : super(key: key);

  @override
  State<EditEntryPage> createState() => _EditEntryState();
}

class _EditEntryState extends State<EditEntryPage> {
  final TextEditingController uanController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fathernameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController bloodTypeController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController minorityController = TextEditingController();
  final TextEditingController materialStatusController =
      TextEditingController();
  final TextEditingController identityTypeController = TextEditingController();
  final TextEditingController identityNumberController =
      TextEditingController();
  final TextEditingController permanentlocalityController =
      TextEditingController();
  final TextEditingController permanentstateController =
      TextEditingController();
  final TextEditingController permanentcityController = TextEditingController();
  final TextEditingController permanentdistrictController =
      TextEditingController();
  final TextEditingController permanentpincodeController =
      TextEditingController();
  final TextEditingController currentlocalityController =
      TextEditingController();
  final TextEditingController currentstateController = TextEditingController();
  final TextEditingController currentcityController = TextEditingController();
  final TextEditingController currentdistrictController =
      TextEditingController();
  final TextEditingController currentpincodeController =
      TextEditingController();
  final TextEditingController workingoccupationController =
      TextEditingController();
  final TextEditingController workingmobileNumberController =
      TextEditingController();
  final TextEditingController workingstateController = TextEditingController();
  final TextEditingController workingcityController = TextEditingController();

  String personalDetails = '';
  String personalSubDetails = '';
  String permanentAddressDetails = '';
  String currentAddressDetails = '';
  String workingDetails = '';

  String defaultGenderValue = 'Gender';
  String defaultPwdValue = 'PWD';
  String defaultMinorityValue = 'Minority';
  String defaultmaritalValue = 'Marital Status';
  String defaultIdentityTypeValue = 'Identity Type';

  @override
  void dispose() {
    uanController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    fathernameController.dispose();
    dobController.dispose();
    genderController.dispose();
    bloodTypeController.dispose();
    mobileNumberController.dispose();
    pwdController.dispose();
    categoryController.dispose();
    materialStatusController.dispose();
    minorityController.dispose();
    identityTypeController.dispose();
    identityNumberController.dispose();
    permanentlocalityController.dispose();
    permanentstateController.dispose();
    permanentcityController.dispose();
    permanentdistrictController.dispose();
    permanentpincodeController.dispose();
    currentlocalityController.dispose();
    currentstateController.dispose();
    currentcityController.dispose();
    currentdistrictController.dispose();
    currentpincodeController.dispose();
    workingoccupationController.dispose();
    workingmobileNumberController.dispose();
    workingstateController.dispose();
    workingcityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Send a signal to refresh the dashboard page

        widget.dashboardBloc.add(DashboardInitialFechEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Edit Entry")),
        body: BlocConsumer<DashboardBloc, DashboardState>(
          bloc: widget.dashboardBloc,
          listener: (context, state) {
            if (state is EditSuccessState) {
              _showSuccessDialog(context);
            }
            if (state is EditErrorState) {
              _showErrorDialog(context, state.errorMessage.substring(86, 141));
            }
          },
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text("Personal Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
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
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: mobileNumberController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Mobile Number",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "First Name",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Last Name",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: fathernameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Father Name",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: InputDecorator(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              contentPadding: const EdgeInsets.all(10)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: null,
                              isExpanded: true,
                              hint: Text(defaultGenderValue),
                              items: const [
                                DropdownMenuItem<String>(
                                    value: 'Male', child: Text("Male")),
                                DropdownMenuItem<String>(
                                    value: 'Female', child: Text("Female")),
                                DropdownMenuItem<String>(
                                    value: 'Other', child: Text("Other")),
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  defaultGenderValue = value.toString();
                                  genderController.text = value ?? '';
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: dobController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "dd/mm/yyyy",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: bloodTypeController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Blood Type",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: InputDecorator(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              contentPadding: const EdgeInsets.all(10)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: null,
                              isExpanded: true,
                              hint: Text(defaultPwdValue),
                              items: const [
                                DropdownMenuItem<String>(
                                    value: 'Yes', child: Text("Yes")),
                                DropdownMenuItem<String>(
                                    value: 'No', child: Text("No")),
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  defaultPwdValue = value.toString();
                                  pwdController.text = value ?? '';
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: categoryController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Category",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: InputDecorator(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              contentPadding: const EdgeInsets.all(10)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: null,
                              isExpanded: true,
                              hint: Text(defaultMinorityValue),
                              items: const [
                                DropdownMenuItem<String>(
                                    value: 'Yes', child: Text("Yes")),
                                DropdownMenuItem<String>(
                                    value: 'No', child: Text("No")),
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  defaultMinorityValue = value.toString();
                                  minorityController.text = value ?? '';
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: InputDecorator(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              contentPadding: const EdgeInsets.all(10)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: null,
                              isExpanded: true,
                              hint: Text(defaultmaritalValue),
                              items: const [
                                DropdownMenuItem<String>(
                                    value: 'Yes', child: Text("Yes")),
                                DropdownMenuItem<String>(
                                    value: 'No', child: Text("No")),
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  defaultmaritalValue = value.toString();
                                  materialStatusController.text = value ?? '';
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: InputDecorator(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              contentPadding: const EdgeInsets.all(10)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: null,
                              isExpanded: true,
                              hint: Text(defaultIdentityTypeValue),
                              items: const [
                                DropdownMenuItem<String>(
                                    value: 'Aadhar', child: Text("Aadhar")),
                                DropdownMenuItem<String>(
                                    value: 'Pancard', child: Text("Pancard")),
                                DropdownMenuItem<String>(
                                    value: 'Driving Licence',
                                    child: Text("Driving Licence")),
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  defaultIdentityTypeValue = value.toString();
                                  identityTypeController.text = value ?? '';
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: identityNumberController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Identity Number",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text("Permanent Address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: permanentlocalityController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Locality",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: permanentdistrictController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "District",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: permanentcityController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "City",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: permanentstateController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "State",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: permanentpincodeController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Pincode",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text("Current Address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: currentlocalityController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Locality",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: currentdistrictController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "District",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(height: 20),
                      Expanded(
                        child: TextField(
                          controller: currentcityController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "City",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: currentstateController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "State",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: currentpincodeController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Pincode",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text("Working Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: workingoccupationController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Occupation",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: workingmobileNumberController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Telephone Number",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: workingstateController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "State",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: workingcityController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "City",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      if (uanController.text.isEmpty ||
                          firstNameController.text.isEmpty ||
                          lastNameController.text.isEmpty ||
                          fathernameController.text.isEmpty ||
                          dobController.text.isEmpty ||
                          genderController.text.isEmpty ||
                          bloodTypeController.text.isEmpty ||
                          mobileNumberController.text.isEmpty ||
                          pwdController.text.isEmpty ||
                          categoryController.text.isEmpty ||
                          minorityController.text.isEmpty ||
                          identityTypeController.text.isEmpty ||
                          identityNumberController.text.isEmpty ||
                          permanentlocalityController.text.isEmpty ||
                          permanentstateController.text.isEmpty ||
                          permanentcityController.text.isEmpty ||
                          permanentdistrictController.text.isEmpty ||
                          permanentpincodeController.text.isEmpty ||
                          currentlocalityController.text.isEmpty ||
                          currentstateController.text.isEmpty ||
                          currentcityController.text.isEmpty ||
                          currentdistrictController.text.isEmpty ||
                          currentpincodeController.text.isEmpty ||
                          workingoccupationController.text.isEmpty ||
                          workingmobileNumberController.text.isEmpty ||
                          workingstateController.text.isEmpty ||
                          workingcityController.text.isEmpty) {
                        _showInErrorDialog(
                            context, "Please fill all the fields");
                      } else {
                        personalDetails =
                            "First Name: ${firstNameController.text}; Last Name: ${lastNameController.text}; Father Name: ${fathernameController.text}; Date of Birth: ${dobController.text} ; Gender: ${genderController.text}; Blood Type: ${bloodTypeController.text}; Mobile Number: ${mobileNumberController.text}";
                        personalSubDetails =
                            "Pwd: ${pwdController.text}; Category: ${categoryController.text}; Minority: ${minorityController.text}; Marital Status: ${materialStatusController.text}; Identity Type: ${identityTypeController.text}; Identity Number: ${identityNumberController.text}";
                        permanentAddressDetails =
                            "Locality: ${permanentlocalityController.text}; State: ${permanentstateController.text}; City: ${permanentcityController.text}; District: ${permanentdistrictController.text}; Pincode: ${permanentpincodeController.text};";
                        currentAddressDetails =
                            "Locality: ${currentlocalityController.text}; State: ${currentstateController.text}; City: ${currentcityController.text}; District: ${currentdistrictController.text}; Pincode: ${currentpincodeController.text};";
                        workingDetails =
                            "Occupation: ${workingoccupationController.text}; MobileNumber: ${workingmobileNumberController.text}; State: ${workingstateController.text}; City: ${workingcityController.text};";
                        // Add Entry logic
                        widget.dashboardBloc.add(DashBoardEditEntry(
                          transactionModel: TransactionModel(
                              "",
                              DateTime.now(),
                              int.parse(uanController.text),
                              personalDetails,
                              personalSubDetails,
                              permanentAddressDetails,
                              currentAddressDetails,
                              workingDetails),
                        ));
                      }
                    },
                    child: Container(
                      width: 150,
                      height: 50,
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showInErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(errorMessage),
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

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Successful"),
          content: const Text("Press Okay to Continue"),
          actions: <Widget>[
            TextButton(
              child: const Text("Okay"),
              onPressed: () {
                // Dismiss the dialog and navigate back to the previous screen
                Navigator.pop(context);
                // Send a signal to refresh the dashboard page
                widget.dashboardBloc.add(DashboardInitialFechEvent());
                Navigator.pop(context); // Navigate back to the previous screen
              },
            )
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
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
}
