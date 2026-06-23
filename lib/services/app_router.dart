import 'package:bloc_apps/screens/recycle_bin.dart';
import 'package:bloc_apps/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // ? is for returing the null here
  Route? onGenereateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TasksScreen.id:
        return MaterialPageRoute(builder: (_) => const TasksScreen());
      default:
        return null;
    }
  }
}
