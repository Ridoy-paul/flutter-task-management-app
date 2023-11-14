import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/ui/screens/cancel_task_screen.dart';
import 'package:flutter_task_management_app/ui/screens/completed_task_screen.dart';
import 'package:flutter_task_management_app/ui/screens/new_task_screen.dart';
import 'package:flutter_task_management_app/ui/screens/progress_task_screen.dart';
import 'package:flutter_task_management_app/ui/style.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompletedTaskScreen(),
    CancelTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: colorGreen,
        unselectedItemColor: colorGray,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "New"),
          BottomNavigationBarItem(icon: Icon(Icons.running_with_errors), label: "In Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: "Cancel"),
        ],
      ),
    );
  }
}
