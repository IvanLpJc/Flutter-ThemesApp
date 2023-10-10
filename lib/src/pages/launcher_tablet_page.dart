import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:themes_app/src/models/layout_model.dart';
import 'package:themes_app/src/routes/routes.dart';
import 'package:themes_app/src/themes/theme.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: appTheme.currentTheme.colorScheme.secondary,
          title: const Text('Flutter Designs - Tablet'),
        ),
        drawer: const _MenuPrincipal(),
        // body: _ListaOpciones(),
        body: Row(
          children: [
            SizedBox(
              width: 300,
              height: double.infinity,
              child: _ListaOpciones(),
            ),
            Container(
              width: 1,
              height: double.infinity,
              color: appTheme.darkTheme
                  ? Colors.grey
                  : appTheme.currentTheme.colorScheme.secondary,
            ),
            Expanded(child: layoutModel.currentPage),
          ],
        ));
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final accentColor = appTheme.colorScheme.secondary;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: accentColor),
        title: Text(pageRoutes[i].title),
        trailing: Icon(Icons.chevron_right, color: accentColor),
        onTap: () {
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pageRoutes[i].page;
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal();

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final accentColor = themeChanger.currentTheme.colorScheme.secondary;

    return Drawer(
      backgroundColor: themeChanger.currentTheme.scaffoldBackgroundColor,
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: const Text(
                  'ILJ',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          Expanded(
            child: _ListaOpciones(),
          ),
          ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: accentColor,
              ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: themeChanger.darkTheme,
                onChanged: (value) => themeChanger.darkTheme = value,
              )),
          ListTile(
            leading: Icon(
              Icons.add_to_home_screen,
              color: accentColor,
            ),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
                value: themeChanger.customTheme,
                onChanged: (value) => themeChanger.customTheme = value),
          )
        ],
      ),
    );
  }
}
