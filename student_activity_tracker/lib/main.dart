import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const StudentActivityTracker());
}

class StudentActivityTracker extends StatelessWidget {
  const StudentActivityTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Activity Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueAccent),
      home: const HomePage(),
    );
  }
}
