import 'package:bloc_apps/blocs/bloc_export.dart';
import 'package:bloc_apps/models/task.dart';
import 'package:bloc_apps/screens/mydrawer.dart';
import 'package:bloc_apps/widget/addTask.dart';
import 'package:bloc_apps/widget/tasks_list.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  static const id = 'tasks_screen';

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(child: AddTaskScreen());
      },
    );
  }

  // List<Task> taskslist = [
  //   Task(title: 'hellow'),
  //   Task(title: 'hellow'),
  //   Task(title: 'hellow'),
  // ];
  @override
  Widget build(BuildContext context) {
    // create a temporary task list here

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: Text('Tasks App'),
            // actions: [
            //   IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            // ],
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(label: Text('${state.allTasks.length}\tTasks')),
              ),
              TaskList(taskslist: tasksList),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
