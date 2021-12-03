import 'package:flutter/material.dart';
import 'package:queen_themes/queen_theme.dart';
import 'config/themes.dart';

void main() {
  QTheme.boot(AppThemesConfig());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return QThemeBuilder(
      builder: (ctx, theme) => MaterialApp(
        theme: theme,
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => QTheme.next(),
            child: const Icon(Icons.add),
          ),
          body: Center(
            child: Text(
              QTheme.currentIndex.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          appBar: AppBar(
            title: const Text('👑 Queen Themes'),
          ),
        ),
      ),
    );
  }
}
