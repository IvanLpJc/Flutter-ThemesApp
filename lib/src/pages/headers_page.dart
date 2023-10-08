import 'package:provider/provider.dart';
import 'package:themes_app/src/themes/theme.dart';
import 'package:themes_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color =
        Provider.of<ThemeChanger>(context).currentTheme.colorScheme.secondary;
    return Scaffold(
        body: HeaderWave(
      color: color,
    ));
  }
}
