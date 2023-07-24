import 'package:flutter/material.dart';
import 'package:vk/ui/navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VK',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
        ),
      ),
      initialRoute: MainNavigationRouteNames.loaderWidget,
      routes: mainNavigation.routes,
    );
  }
}

