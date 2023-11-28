import 'package:flutter/material.dart';
import '../../data/models/task_summery_count_summery_model.dart';
import '../../data/models/task_count.dart';
import '../../data/utility/helpers.dart';
import '../../data/models/task_list_model.dart';
import '../../data/data_network_caller/network_caller.dart';
import '../../data/data_network_caller/network_response.dart';
import '../../data/utility/urls.dart';
import '../widgets/snack_message.dart';
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
  bool _getTaskCountSummeryInProgress = false;

  TaskListModel taskListModel = TaskListModel();
  TaskCountSummeryListModel taskCountSummeryListModel = TaskCountSummeryListModel();
  
  Future<void> getNewTaskList() async {
    _getNewTaskInProgress = true;
    
    if(mounted) { /// here mounted means user is in this screen
      setState(() {});
    }
    
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getNewTask);
    if(response.isSuccess) {
      taskListModel = TaskListModel.fromJson(response.jsonResponse);
    }

    _getNewTaskInProgress = false;
    if(mounted) {
      setState(() {});
    }
  }

  Future<void> getTaskCountSummeryList() async {
    _getTaskCountSummeryInProgress = true;

    if(mounted) { /// here mounted means user is in this screen
      setState(() {});
    }

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getTaskStatusCount);
    if(response.isSuccess) {
      taskCountSummeryListModel = TaskCountSummeryListModel.fromJson(response.jsonResponse);
    }

    _getTaskCountSummeryInProgress = false;
    if(mounted) {
      setState(() {});
    }
  }



  @override
  void initState() {
    super.initState();
    getTaskCountSummeryList();
    getNewTaskList();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummery(),
            Visibility(
              visible: _getTaskCountSummeryInProgress == false,
              replacement: const LinearProgressIndicator(),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: taskCountSummeryListModel.taskCountList?.length ?? 0,
                  itemBuilder: (context, index) {
                    TaskCount taskCount = taskCountSummeryListModel.taskCountList![index];
                    return FittedBox(
                      child: SummeryCard(
                        title: taskCount.sId ?? '',
                        value: taskCount.sum.toString(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Visibility(
                visible: _getNewTaskInProgress == false,
                replacement: circleProgressIndicatorShow(),
                child: ListView.builder(
                    itemCount: taskListModel.taskList?.length ?? 0,
                    itemBuilder: (count, index) {
                      return TaskItemCard(
                        task: taskListModel.taskList![index],
                        onStatusChange: () {
                          getNewTaskList();
                        },
                        showProgress: (inProgress) {
                          _getNewTaskInProgress = inProgress;
                          if(mounted) {
                            setState(() {});
                            if(inProgress == false) {
                              showSnackMessage(context, "Task Status Updated.");
                            }
                          }
                        },
                      );
                  },
                ),
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
