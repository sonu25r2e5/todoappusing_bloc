import 'package:bloc_apps/blocs/bloc_export.dart';
import 'package:bloc_apps/blocs/tasks_bloc/tasks_bloc.dart';
import 'package:bloc_apps/models/task.dart';
import 'package:bloc_apps/widget/tasks_list.dart';
import 'package:flutter/material.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({super.key});

  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    // create a temporary task list here

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;

        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Chip(label: Text('${tasksList.length}\tTasks'))),
              TaskList(taskslist: tasksList),
            ],
          ),
        );
      },
    );
  }
}
