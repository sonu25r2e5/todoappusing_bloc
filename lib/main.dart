import 'package:bloc_apps/blocs/bloc_export.dart';
// import 'package:bloc_apps/models/task.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'screens/tasks_screen.dart';

void main() async {
  // we nned to wrap with bloc overrides so its run bloc first
  // bloc overrides lies in bloc not in flutter_bloc keep in mind
  // we need path initatilization

  //widget binding
  WidgetsFlutterBinding.ensureInitialized(); // fro statorage purpose we use this.

  // final directory = await getApplicationDocumentsDirectory();

  // final storage = await HydratedStorageDirectory(
  //  await getApplicationDocumentsDirectory
  // );

  final storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationDocumentsDirectory()).path,
    ),
  );

  HydratedBloc.storage = storage;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: TasksScreen(),
      ),
    );
  }
}
