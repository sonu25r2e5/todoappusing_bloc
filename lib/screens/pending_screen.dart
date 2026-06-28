import 'package:bloc_apps/blocs/bloc_export.dart';
import 'package:bloc_apps/models/task.dart';
import 'package:bloc_apps/widget/tasks_list.dart';
import 'package:flutter/material.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    // create a temporary task list here

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;

        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.pendingTasks.length}\t Pending | ${state.completedTasks.length} CompletedTasks',
                  ),
                ),
              ),
              TaskList(taskslist: tasksList),
            ],
          ),
        );
      },
    );
  }
}
