import 'package:flutter/material.dart';
import 'package:vk/domain/api_client/api_client.dart';

class FriendsListViewModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  List friendsList = [];

  FriendsListViewModel() {
    loadFriendsList();
  }

  Future<void> loadFriendsList() async {
    friendsList = await _apiClient.getFriendsList();
    notifyListeners();
  }
}
