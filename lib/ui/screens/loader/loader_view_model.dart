import 'package:flutter/material.dart';
import 'package:vk/domain/services/auth_service.dart';
import 'package:vk/ui/navigation/main_navigation.dart';

//поскольку на данном экране никоглда ничего не будет меняться, то ChangeNotifier не нужен
class LoaderViewModel {
  final _authService = AuthService();
  final BuildContext context;

  LoaderViewModel(this.context) {
    asyncInit();
  }

  Future<void> asyncInit() async {
    await checkAuth();
  }

  Future<void> checkAuth() async {
    final isAuth = await _authService.isAuth();
    final nextScreen = isAuth
        ? MainNavigationRouteNames.mainScreen
        : MainNavigationRouteNames.auth;
    Navigator.of(context).pushReplacementNamed(nextScreen);
  }
}
