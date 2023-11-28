import 'package:flutter/material.dart';
import '../../data/models/task.dart';
import '../style.dart';

enum TaskStatus {
  New,
  Progress,
  Completed,
  Cancelled,
}

class TaskItemCard extends StatefulWidget {
  final Task task;
  const TaskItemCard({
    super.key,
    required this.task,
  });

  @override
  State<TaskItemCard> createState() => _TaskItemCardState();
}

class _TaskItemCardState extends State<TaskItemCard> {
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
                        showUpdateStatusModal();
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

  void showUpdateStatusModal() {
    List<Container> items = TaskStatus.values.map((e) => Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () {
          print("$e");
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: colorGray)
        ),
        leading: Icon(Icons.check),
        title: Text("${e.name}"),
      ),
    )).toList();


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Update Status",
            style: TextStyle(fontSize: 18),
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