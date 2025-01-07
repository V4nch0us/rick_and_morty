import 'dart:ui';

class AppTextStyles {
  static const double _largeFontSize = 16;
  static const double _mediumFontSize = 14;
  static const double _smallFontSize = 12;

  static TextStyle subtitleBold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: _largeFontSize,
  );

  static TextStyle bodyBold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: _mediumFontSize,
  );

  static TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: _mediumFontSize,
  );

  static TextStyle captionBold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: _smallFontSize,
  );

  static TextStyle captionMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: _smallFontSize,
  );
}
