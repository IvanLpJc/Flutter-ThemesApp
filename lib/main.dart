import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themes_app/src/models/layout_model.dart';
import 'package:themes_app/src/pages/pages.dart';
import 'package:themes_app/src/themes/theme.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(1),
        ),
        ChangeNotifierProvider(
          create: (_) => LayoutModel(),
        ),
      ], child: const MyApp()),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Themes App',
      home: OrientationBuilder(
        builder: (context, orientation) {
          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return const LauncherTabletPage();
          } else {
            return const LauncherPage();
          }
        },
      ),
    );
  }
}
