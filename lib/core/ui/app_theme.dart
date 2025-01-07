import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.irisBlue,
    primary: AppColors.irisBlue,
    surface: AppColors.whiteSmoke,
    brightness: Brightness.light,
  ),
  textTheme: textTheme.apply(
    fontFamily: GoogleFonts.lato().fontFamily,
    bodyColor: AppColors.nero,
  ),
);

const TextTheme textTheme = TextTheme();
