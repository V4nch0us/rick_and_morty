import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/details/presentation/pages/details_page.dart';
import '../../features/home/presentation/pages/home_page.dart';

class AppRoutes {
  static const String homePath = '/';
  static const String _detailsPath = '/details/:id';

  get detailsPath => _detailsPath.replaceAll("/:id", '');
}

class AppRouterHelper {
  static final AppRouterHelper _instance = AppRouterHelper._internal();

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

  static AppRouterHelper get instance => _instance;

  factory AppRouterHelper() => _instance;

  AppRouterHelper._internal() {
    final routes = [
      GoRoute(
        path: AppRoutes.homePath,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: AppRoutes._detailsPath,
        builder: (context, state) => DetailsPage(
          id: int.parse(state.pathParameters['id']!),
        ),
      ),
    ];

    router = GoRouter(
      routes: routes,
      initialLocation: AppRoutes.homePath,
      navigatorKey: parentNavigatorKey,
    );
  }
}
