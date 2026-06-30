import 'package:bloc_apps/blocs/bloc_export.dart';
import 'package:bloc_apps/models/task.dart';
import 'package:bloc_apps/screens/completed_task_screen.dart';
import 'package:bloc_apps/screens/favorite_task_screen.dart';
import 'package:bloc_apps/screens/mydrawer.dart';
import 'package:bloc_apps/screens/pending_screen.dart';
import 'package:bloc_apps/widget/addTask.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  // create it's id here understood
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // we have three tabs so listed here.
  final List<Map<String, dynamic>> _pageDetails = [
    {
      'pageName': const PendingScreen(),
      'title': 'pending Tasks',
      'action': Icon(Icons.delete),
    },
    {'pageName': CompletedTaskScreen(), 'title': 'Completed Tasks'},
    {'pageName': const FavoriteTaskScreen(), 'title': 'Favorite tasks'},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      // for showing the bottom we use isScrollCOntrolled
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(child: AddTaskScreen());
      },
    );
  }

  void _deleteCompletedTasks(BuildContext context, List<Task> completedTasks) {
    for (final task in completedTasks) {
      context.read<TasksBloc>().add(RemoveTask(task: task));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        final completedTasks = tasksList.where((task) => task.isDone!).toList();
        final hasCompletedTasks = completedTasks.isNotEmpty;
        return Scaffold(
          appBar: AppBar(
            title: Text(_pageDetails[_selectedPageIndex]['title']),
            actions: [
              hasCompletedTasks
                  ? IconButton(
                      onPressed: () =>
                          _deleteCompletedTasks(context, completedTasks),
                      icon: const Icon(Icons.delete),
                      tooltip: 'Delete completed tasks',
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          drawer: MyDrawer(),
          body: _pageDetails[_selectedPageIndex]['pageName'],
          // write the condintion
          floatingActionButton: _selectedPageIndex == 0
              ? FloatingActionButton(
                  onPressed: () => _addTask(context),
                  tooltip: 'Add Task',
                  child: Icon(Icons.add),
                )
              : null,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPageIndex,
            onTap: (index) {
              setState(() {
                _selectedPageIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.incomplete_circle_sharp),
                label: 'Pending tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.done),
                label: 'Complete task',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite Tasks',
              ),
            ],
          ),
        );
      },
    );
  }
}
