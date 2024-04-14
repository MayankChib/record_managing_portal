import 'package:flutter/material.dart';
import 'package:flutter_record_magering_portal/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_record_magering_portal/models/transaction_model.dart';

class AddEntryPage extends StatefulWidget {
  final DashboardBloc dashboardBloc;
  const AddEntryPage({super.key, required this.dashboardBloc});

  @override
  State<AddEntryPage> createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntryPage> {
  final TextEditingController uanController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: uanController,
            decoration: const InputDecoration(hintText: "Enter a number"),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: firstNameController,
            decoration: const InputDecoration(hintText: "First Name"),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: lastNameController,
            decoration: const InputDecoration(hintText: "last Name"),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              widget.dashboardBloc.add(DashBoardAddEntry(
                  transactionModel: TransactionModel(
                      "0x2B7E117A6f3030f453DdBDff6B0800F452eafD80",
                      DateTime.now(),
                      int.parse(uanController.text),
                      firstNameController.text,
                      lastNameController.text)));
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.amber,
              ),
              child: const Center(
                child: Text(
                  "Add Entry",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
