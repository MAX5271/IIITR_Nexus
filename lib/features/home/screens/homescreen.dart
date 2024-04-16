import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iiitrnexus1/features/auth/controllers/auth_controller.dart';
import 'package:iiitrnexus1/features/home/drawers/community_list_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                displayDrawer(context);
              },
            );
          }),
          title: const Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
            IconButton(
              iconSize: 1,
              onPressed: () {},
              icon: CircleAvatar(
                backgroundImage: NetworkImage(user.profilePic),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            )
          ],
        ),
        drawer: CommunityListDrawer(),
      ),
    );
  }
}
