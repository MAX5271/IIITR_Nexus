import 'package:flutter/material.dart';
import 'package:iiitrnexus1/features/auth/screens/signin.dart';
import 'package:iiitrnexus1/features/community/screens/community_screens.dart';
import 'package:iiitrnexus1/features/community/screens/create_community_screen.dart';
import 'package:iiitrnexus1/features/community/screens/edit_community.dart';
import 'package:iiitrnexus1/features/community/screens/mod_tools_screen.dart';
import 'package:iiitrnexus1/features/home/screens/homescreen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => MaterialPage(
        child: SignIn(),
      ),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(
        child: HomeScreen(),
      ),
  '/create-community': (_) => const MaterialPage(
        child: CreateCommunityScreen(),
      ),
  '/r/:name': (route) => MaterialPage(
        child: CommunityScreen(
          name: route.pathParameters['name']!,
        ),
      ),
  '/mod-tools/:name': (routeData) => MaterialPage(
      child: ModToolsScreen(name: routeData.pathParameters['name']!)),
  '/edit-community/:name': (routeData) => MaterialPage(
      child: EditCommunityScreen(name: routeData.pathParameters['name']!)),
    //   '/add-mods/:name': (routeData) => MaterialPage(
    //       child: AddModsScreen(
    //         name: routeData.pathParameters['name']!,
    //       ),
    //     ),
    // '/u/:uid': (routeData) => MaterialPage(
    //       child: UserProfileScreen(
    //         uid: routeData.pathParameters['uid']!,
    //       ),
    //     ),
    // '/edit-profile/:uid': (routeData) => MaterialPage(
    //       child: EditProfileScreen(
    //         uid: routeData.pathParameters['uid']!,
    //       ),
    //     ),
    // '/add-post/:type': (routeData) => MaterialPage(
    //       child: AddPostTypeScreen(
    //         type: routeData.pathParameters['type']!,
    //       ),
    //     ),
    // '/post/:postId/comments': (route) => MaterialPage(
    //       child: CommentsScreen(
    //         postId: route.pathParameters['postId']!,
    //       ),
    //     ),
    // '/add-post': (routeData) => const MaterialPage(
    //       child: AddPostScreen(),
    //     ),
});
