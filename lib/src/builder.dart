import 'package:flutter/material.dart';

import 'controller.dart';

typedef ThemeBuilderDef = Widget Function(
    BuildContext context, ThemeData theme);

class QThemeBuilder extends StatefulWidget {
  final ThemeBuilderDef builder;
  const QThemeBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  _QThemeBuilderState createState() => _QThemeBuilderState();
}

class _QThemeBuilderState extends State<QThemeBuilder> {
  @override
  void initState() {
    QTheme.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.builder(
        context,
        QTheme.current,
      );
}
