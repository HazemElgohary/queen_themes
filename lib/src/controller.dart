import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'config.dart';

// ignore: non_constant_identifier_names
final QTheme = QBaseTheme();

class QBaseTheme extends ChangeNotifier {
  QThemeConfig _config = BaseQThemeConfig();
  QThemeConfig get config => _config;

  Future<void> boot([QThemeConfig? config]) async {
    if (config != null) {
      _config = config;
      log('[Q][Theme] config update !');
    }
  }

  ThemeData? _current;
  ThemeData get current => _current ?? config.themes.first;
  int get currentIndex => config.themes.indexOf(current);

  void updateTo(int index) {
    try {
      _current = config.themes[index];
      notifyListeners();
    } on RangeError {
      log('cant update theme to $index since it\'s out of bound');
    }
  }

  void next() {
    if (currentIndex == config.themes.length - 1) {
      updateTo(0);
    } else {
      updateTo(currentIndex + 1);
    }
  }
}
