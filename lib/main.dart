import 'package:animalswale_app/data/repository/auth_repo.dart';
import 'package:animalswale_app/data/repository/dashboard_repo.dart';
import 'package:animalswale_app/data/repository/repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/my_strings.dart';
import 'core/themes/app_themes.dart';
import 'firebase_options.dart';
import 'presentation/routers/routers_import.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "AnimalsWale",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(RepositoryProvider(
    create: (context) =>
        Repository(
        authRepo: AuthRepo(),
        dashboardRepo: DashboardRepo(),
    ),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: MyStrings.appName,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeMode: ThemeMode.system,
            routerConfig: _appRouter.config(),
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        }
    );
  }
}