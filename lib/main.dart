import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/injectable.dart';
import 'core/navigation/router.dart';

void main() {
  AppRouterHelper.instance;
  configureDependencies();
  runApp(const RickAndMortyApp());
}
