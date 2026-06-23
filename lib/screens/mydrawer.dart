import 'package:bloc_apps/blocs/bloc/tasks_bloc.dart';
import 'package:bloc_apps/blocs/bloc_export.dart';
import 'package:bloc_apps/screens/recycle_bin.dart';
import 'package:bloc_apps/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(TasksScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My text'),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            ),
            Divider(),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
              child: ListTile(
                leading: Icon(Icons.delete),
                title: Text('My Bin'),
                trailing: Text('0'),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
