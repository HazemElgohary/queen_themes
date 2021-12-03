import 'package:flutter/material.dart';

import 'controller.dart';

/// app them builder
/// gets called when theme changes
typedef ThemeBuilderDef = Widget Function(
  BuildContext context,
  ThemeData theme,
);

/// * queen theme builder
class QThemeBuilder extends StatefulWidget {
  /// the app builder
  final ThemeBuilderDef builder;

  /// takes builder to calls every time theme changes
  const QThemeBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  _QThemeBuilderState createState() => _QThemeBuilderState();
}

class _QThemeBuilderState extends State<QThemeBuilder> {
  @override
  void initState() {
    QTheme.addListener(() {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.builder(
        context,
        QTheme.current,
      );
}
