import 'package:flutter/material.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/style.dart';

class TaskManagementApp extends StatelessWidget {
  const TaskManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(

        ///this is used for input type style ---------------->>>>>>>>>>>
        inputDecorationTheme: InputDecorationTheme(
            fillColor: colorAss,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            )
        ),
        ///--------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          )
        ),

        primaryColor: colorGreen,
        primarySwatch: Colors.green,
      ),
    );
  }
}
