// running at part4: at 9:45 min remember that keep in mind

import 'package:bloc_apps/blocs/bloc_export.dart';
import 'package:bloc_apps/blocs/switch_bloc/switch_state.dart';
import 'package:bloc_apps/screens/tabs_screen.dart';
import 'package:bloc_apps/services/app_router.dart';
import 'package:bloc_apps/services/app_theme.dart';
// import 'package:bloc_apps/models/task.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // create: (context) => TasksBloc(),
      providers: [
        // two bloc
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Tasks App',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const TabsScreen(),
            onGenerateRoute: appRouter.onGenereateRoute,
          );
        },
      ),
    );
  }
}
