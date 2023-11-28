import 'package:flutter/material.dart';
import '../../data/data_network_caller/network_caller.dart';
import '../../data/utility/urls.dart';
import '../../data/models/task.dart';
import '../style.dart';

enum TaskStatus {
  New,
  Progress,
  Completed,
  Cancelled,
}

class TaskItemCard extends StatefulWidget {
  const TaskItemCard({
    super.key,
    required this.task,
    required this.onStatusChange,
    required this.showProgress,
  });

  final Task task;
  final VoidCallback onStatusChange;
  final Function(bool) showProgress;


  @override
  State<TaskItemCard> createState() => _TaskItemCardState();
}

class _TaskItemCardState extends State<TaskItemCard> {

  Future<void> updateTaskStatus(String status) async {
    widget.showProgress(true);

    final response = await NetworkCaller().getRequest(Urls.updateTaskStatus(widget.task.sId ?? '', status));
    if(response.isSuccess) {
      widget.onStatusChange();
    }

    widget.showProgress(false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.task.title ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            const SizedBox(height: 4,),
            Text(widget.task.description ?? ''),
            const SizedBox(height: 4,),
            Text("Date: ${widget.task.createdDate}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    widget.task.status ?? '',
                    style: const TextStyle(color: colorWhite),
                  ),
                  backgroundColor: colorBlue,
                ),
                Wrap(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                          Icons.delete_forever_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        showUpdateStatusModal(widget.task.status ?? '');
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );



  }

  void showUpdateStatusModal(String status) {

    List<Container> items = TaskStatus.values.map((e) => Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
        onTap: () {
          updateTaskStatus(e.name);
          Navigator.pop(context);
        },
        tileColor: status == e.name ? colorGreen : colorWhite,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: status != e.name ? colorGray : colorGreen),
        ),
        trailing:  status == e.name ? Icon(Icons.check, size: 30, color: status == e.name ? colorWhite : colorBlack,) : null,
        title: Text(e.name, style:  TextStyle(fontSize: 20, color: status == e.name ? colorWhite : colorBlack)),
      ),
    )).toList();


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Update Status",
            style: TextStyle(fontSize: 20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: items,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            )
          ],
        );
      },
    );
  }

}