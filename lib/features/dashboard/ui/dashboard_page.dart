import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_record_magering_portal/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_record_magering_portal/features/entry/addentry_page.dart';
import 'package:flutter_record_magering_portal/utils/colors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardBloc dashboardBloc = DashboardBloc();

  @override
  void initState() {
    dashboardBloc.add(DashboardInitialFechEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.dashboardpageAccent,
        appBar: AppBar(
          title: const Text("DashBoard"),
          backgroundColor: AppColors.dashboardAppBarAccent,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 40,
            //fontWeight: FontWeight.bold,
          ),
        ),

        //body
        body: BlocConsumer<DashboardBloc, DashboardState>(
          bloc: dashboardBloc,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case DashBoardLoadingState:
                return Center(child: CircularProgressIndicator());
              case DashBoardErrorState:
                return Center(child: Text("Error"));
              case DashBoardSuccessState:
                final successState = state as DashBoardSuccessState;
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      //Top row
                      Container(
                        child: Row(
                          children: [
                            //add entry
                            Expanded(
                              child: InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddEntryPage(
                                              dashboardBloc: dashboardBloc,
                                            ))),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.buttonAccents,
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
                              ),
                            ),
                            const SizedBox(width: 10),
                            //edit entry
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.buttonAccents,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Edit Entry",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            //Add Owners
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.buttonAccents,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Transaction",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            //Fetch Account
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.buttonAccents,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Account",
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
                      ),
                      //show all the transactions made
                      const SizedBox(height: 20),
                      const Text(
                        "Transactions",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                          child: ListView.builder(
                        itemCount: successState.transactions.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      successState.transactions[index].UAN
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Text(
                                  successState.transactions[index].address,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  successState.transactions[index].timestamp
                                      .timeZoneName,
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  successState.transactions[index].firstname,
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  successState.transactions[index].lastname,
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          );
                        },
                      ))
                    ],
                  ),
                );
              default:
                return SizedBox();
            }
          },
        ));
  }
}
