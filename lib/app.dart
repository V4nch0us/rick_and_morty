import 'package:flutter/material.dart';

import 'core/navigation/router.dart';
import 'core/ui/app_theme.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rick and Morty',
      theme: theme,
      routerConfig: AppRouterHelper.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
