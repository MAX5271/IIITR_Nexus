import 'package:flutter/material.dart';
import 'package:iiitrnexus1/features/auth/screens/signin.dart';
import 'package:iiitrnexus1/features/community/screens/community_screens.dart';
import 'package:iiitrnexus1/features/community/screens/create_community_screen.dart';
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
});
