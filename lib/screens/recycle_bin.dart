import 'package:bloc_apps/screens/mydrawer.dart';
import 'package:bloc_apps/widget/tasks_list.dart';
import 'package:flutter/material.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycle Bin'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Chip(label: Text('Tasks'))),
          TaskList(taskslist: []),
        ],
      ),
    );
  }
}
