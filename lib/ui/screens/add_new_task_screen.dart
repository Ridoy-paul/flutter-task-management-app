import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/data/utility/helpers.dart';
import '../widgets/body_background_widget.dart';
import '../style.dart';
import '../widgets/profile_summery_card_widget.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _addNewTaskFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummery(),
             Expanded(
              child: BodyBackgroundWidget(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: _addNewTaskFormKey,
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
                          controller: _titleTEController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: inputStyle("Title"),
                          validator: (value) => inputValidate(value, "Please Enter The Title!"),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _descriptionTEController,
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }

}
