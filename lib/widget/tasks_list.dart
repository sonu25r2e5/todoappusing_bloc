import 'package:bloc_apps/models/task.dart';
import 'package:bloc_apps/widget/tasktitle.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.taskslist});

  final List<Task> taskslist;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.taskslist.length,
        itemBuilder: (context, index) {
          var task = widget.taskslist[index];
          return Tasktitle(task: task);
        },
      ),
    );
  }
}
