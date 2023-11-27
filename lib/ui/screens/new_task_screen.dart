import 'package:flutter/material.dart';
import '../../data/data_network_caller/network_caller.dart';
import '../../data/data_network_caller/network_response.dart';
import '../../data/utility/urls.dart';
import 'add_new_task_screen.dart';
import '../widgets/new_task_summery_widget.dart';
import '../widgets/profile_summery_card_widget.dart';
import '../widgets/task_item_card_widget.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getNewTaskInProgress = false;
  
  Future<void> getNewTaskList() async {
    _getNewTaskInProgress = true;
    
    if(mounted) { /// here mounted means user is in this screen
      setState(() {});
    }
    
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getNewTask);
    
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummery(),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: Row(
                  children: [
                    SummeryCard(
                      title: "New",
                      value: "9",
                    ),
                    SummeryCard(
                      title: "Completed",
                      value: "9",
                    ),
                    SummeryCard(
                      title: "Progress",
                      value: "9",
                    ),
                    SummeryCard(
                      title: "Canceled",
                      value: "9",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (count, index) {
                    return const TaskItemCard();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewTaskScreen(),),);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
