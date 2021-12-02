import 'package:flutter/material.dart';

abstract class QThemeConfig {
  /// * List of available thames
  List<ThemeData> get themes;
}

class BaseQThemeConfig extends QThemeConfig {
  @override
  List<ThemeData> get themes => [
        ThemeData.dark(),
        ThemeData.light(),
      ];
}
