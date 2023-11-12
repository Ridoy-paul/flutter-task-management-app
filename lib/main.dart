import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/ui/screens/splash_screen.dart';

void main() => runApp(TaskManagementapp());

class TaskManagementapp extends StatelessWidget {
  const TaskManagementapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
