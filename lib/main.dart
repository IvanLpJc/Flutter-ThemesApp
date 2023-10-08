import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themes_app/src/pages/pages.dart';
import 'package:themes_app/src/themes/theme.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (_) => ThemeChanger(1), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Themes App',
      home: const LauncherPage(),
    );
  }
}
