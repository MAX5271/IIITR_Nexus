import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iiitrnexus1/features/auth/controllers/auth_controller.dart';
import 'package:iiitrnexus1/features/home/delegates/search_communities_delegates.dart';
import 'package:iiitrnexus1/features/home/drawers/community_list_drawer.dart';
import 'package:iiitrnexus1/features/home/drawers/profile_drawers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
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
              onPressed: () {
                showSearch(
                    context: context, delegate: SearchCommunityDelegate(ref));
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
            Builder(builder: (context) {
              return IconButton(
                iconSize: 1,
                onPressed: () {
                  displayEndDrawer(context);
                },
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePic),
                ),
              );
            })
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
        endDrawer: const ProfileDrawer(),
      ),
    );
  }
}
