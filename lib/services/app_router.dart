import 'package:bloc_apps/screens/recycle_bin.dart';
import 'package:bloc_apps/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // ? is for returing the null here
  Route? onGenereateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => TabsScreen());
      default:
        return null;
    }
  }
}
