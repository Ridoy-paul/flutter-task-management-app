import 'task_count.dart';

class TaskCountSummeryListModel {
  String? status;
  List<TaskCount>? data;

  TaskCountSummeryListModel({this.status, this.data});

  TaskCountSummeryListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TaskCount>[];
      json['data'].forEach((v) {
        data!.add(TaskCount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

