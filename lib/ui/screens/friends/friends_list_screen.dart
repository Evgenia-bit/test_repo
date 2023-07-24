import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/screens/friends/friend_view_model.dart';

class FriendsListScreen extends StatelessWidget {
  const FriendsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Все друзья',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                )),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: Builder(
              builder: (context) {
                final friendsList = context.watch<FriendsListViewModel>().friendsList;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (
                      BuildContext context,
                      int index,
                    ) {
                      return  _ListItem(userName: friendsList[index]['name']);
                    },
                    childCount: friendsList.length,
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}



class _ListItem extends StatelessWidget {
  final String userName;

  const _ListItem({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              userName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.messenger_outline),
          ),
        ],
      ),
    );
  }
}
