import 'package:flutter/material.dart';
import 'ui/screens/splash_screen.dart';


class TaskManagementapp extends StatelessWidget {
  const TaskManagementapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
