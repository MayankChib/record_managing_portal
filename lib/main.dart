import 'package:flutter/material.dart';
import 'package:flutter_record_magering_portal/features/dashboard/ui/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DashboardPage(),
    );
  }
}
