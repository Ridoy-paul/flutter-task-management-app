import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/ui/screens/add_new_task_screen.dart';
import 'package:flutter_task_management_app/ui/widgets/body_background_widget.dart';
import '../style.dart';
import '../widgets/new_task_summery_widget.dart';
import '../widgets/profile_summery_card_widget.dart';
import '../widgets/task_item_card_widget.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummery(),
             SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                        "Add New Task",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: inputStyle("Title"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      maxLines: 8,
                      decoration: const InputDecoration(
                        hintText: "Decoration"
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const MainBottomNavScreen(),),);
                        },
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
