import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/screens/auth/auth_screen.dart';
import 'package:vk/ui/screens/auth/auth_view_model.dart';
import 'package:vk/ui/screens/friends/friend_view_model.dart';
import 'package:vk/ui/screens/friends/friends_list_screen.dart';
import 'package:vk/ui/screens/loader/loader_screen.dart';
import 'package:vk/ui/screens/loader/loader_view_model.dart';
import 'package:vk/ui/screens/main/main_screen.dart';
import 'package:vk/ui/screens/main/main_screen_view_model.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      lazy: false,
      child: const LoaderWidget(),
    );
  }

  Widget makeAuth() {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const AuthWidget(),
    );
  }

  Widget makeMainScreen() {
    return ChangeNotifierProvider(
      create: (_) => MainScreenViewModel(),
      child: const MainScreenWidget(),
    );
  }

  Widget makeFriends() {
    return ChangeNotifierProvider(
      create: (_) => FriendsListViewModel(),
      child: const FriendsListScreen(),
    );
  }
}
