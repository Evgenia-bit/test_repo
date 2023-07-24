import 'package:flutter/cupertino.dart';
import 'package:vk/domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const auth = '/auth';
  static const mainScreen = '/main_screen';
  static const friends = '/friends';
  //static const profile = '/profile';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.auth: (_) => _screenFactory.makeAuth(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMainScreen(),
    MainNavigationRouteNames.friends: (_) => _screenFactory.makeFriends(),
  };

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationRouteNames.loaderWidget,
      (route) => false,
    );
  }
}
