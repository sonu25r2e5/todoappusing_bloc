import 'package:bloc_apps/blocs/bloc_export.dart';
import 'package:bloc_apps/models/task.dart';
import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';

void main() {
  // we nned to wrap with bloc overrides so its run bloc first
  // bloc overrides lies in bloc not in flutter_bloc keep in mind
  Bloc.observer;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TasksBloc()..add(AddTask(task: Task(title: 'Gym 1'))),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: TasksScreen(),
      ),
    );
  }
}
