import 'package:flutter/material.dart';
import 'package:queen_themes/queen_theme.dart';

class AppThemesConfig extends QThemeConfig {
  @override
  List<ThemeData> get themes => [
        ThemeData.dark(),
        ThemeData(
          scaffoldBackgroundColor: Colors.yellow,
        ),
        ThemeData.light(),
        ThemeData(
          scaffoldBackgroundColor: Colors.red,
        ),
      ];
}
