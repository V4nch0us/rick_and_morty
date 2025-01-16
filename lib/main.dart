import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/injectable.dart';

void main() {
  configureDependencies();
  runApp(RickAndMortyApp());
}
