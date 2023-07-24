import 'package:flutter/material.dart';
import 'package:vk/ui/navigation/main_navigation.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Главная',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
              ),
              icon: const Icon(
                Icons.settings,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        const _ProfileWidget(),
        _ListItemWidget(
          iconData: Icons.perm_identity,
          label: 'Друзья',
          routeName: MainNavigationRouteNames.friends,
          trailingWidget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: const Text(
              '94',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const _ListItemWidget(
          iconData: Icons.people_alt_outlined,
          label: 'Сообщества',
          routeName: MainNavigationRouteNames.mainScreen,
        ),
      ],
    );
  }
}

class _ProfileWidget extends StatelessWidget {
  const _ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.black,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Евгения Мочалина',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      'Перейти в профиль',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
            const Icon(Icons.navigate_next, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class _ListItemWidget extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String routeName;
  final Widget? trailingWidget;

  const _ListItemWidget({
    Key? key,
    required this.iconData,
    required this.label,
    required this.routeName,
    this.trailingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0),
        child: Row(
          children: [
            Icon(iconData, size: 35, color: Colors.blue),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            if (trailingWidget != null) trailingWidget!,
          ],
        ),
      ),
    );
  }
}
