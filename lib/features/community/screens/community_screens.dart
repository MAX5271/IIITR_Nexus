import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iiitrnexus1/features/auth/controllers/auth_controller.dart';
import 'package:iiitrnexus1/features/common/error.dart';
import 'package:iiitrnexus1/features/common/loader.dart';
import 'package:iiitrnexus1/features/community/controller/community_controller.dart';
import 'package:routemaster/routemaster.dart';

class CommunityScreen extends ConsumerWidget {
  final String name;

  void navigateToModTools(BuildContext context) {
    Routemaster.of(context).push('/mod-tools');
  }

  const CommunityScreen({required this.name, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;

    return Scaffold(
        body: ref.watch(getCommunityByNameProvider(name)).when(
            data: (community) => NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    const SliverAppBar(
                      floating: true,
                      snap: true,
                      expandedHeight: 150,
                      flexibleSpace: Stack(
                        children: [
                          Positioned.fill(
                            child: Image(
                              image: AssetImage('assets/defaultBanner.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(community.avatar),
                                radius: 35,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  community.name,
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                community.mods.contains(user.uid)
                                    ? OutlinedButton(
                                        style: const ButtonStyle(
                                          padding: MaterialStatePropertyAll(
                                            EdgeInsets.all(12),
                                          ),
                                        ),
                                        onPressed: () {
                                          navigateToModTools(context);
                                        },
                                        child: const Text("Mod Tools"),
                                      )
                                    : OutlinedButton(
                                        style: const ButtonStyle(
                                            padding: MaterialStatePropertyAll(
                                                EdgeInsets.all(12))),
                                        onPressed: () {},
                                        child: Text(
                                            community.members.contains(User)
                                                ? "Joined"
                                                : "Join"),
                                      ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                              ),
                              child:
                                  Text('${community.members.length} members'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: const Text("Displaying posts.")),
            error: (error, stackTrace) => ErrorText(error: error.toString()),
            loading: () => const Loader()));
  }
}
