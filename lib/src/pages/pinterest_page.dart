import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:provider/provider.dart';
import 'package:themes_app/src/themes/theme.dart';

import 'package:themes_app/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        // body: PinterestMenu(),
        // body: PinterestGrid(),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            const PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;

    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (widthPantalla > 500) {
      widthPantalla = widthPantalla + 300;
    }

    return Positioned(
      bottom: 30,
      child: SizedBox(
          width: widthPantalla,
          child: Row(
            children: [
              const Spacer(),
              PinterestMenu(
                mostrar: mostrar,
                backgroundColor: appTheme.scaffoldBackgroundColor,
                activeColor: appTheme.colorScheme.secondary,
                // inactiveColor: Colors.blue,
                items: [
                  PinterestButton(
                      icon: Icons.pie_chart,
                      onPressed: () {
                        if (kDebugMode) {
                          print('Icon pie_chart');
                        }
                      }),
                  PinterestButton(
                      icon: Icons.search,
                      onPressed: () {
                        if (kDebugMode) {
                          print('Icon search');
                        }
                      }),
                  PinterestButton(
                      icon: Icons.notifications,
                      onPressed: () {
                        if (kDebugMode) {
                          print('Icon notifications');
                        }
                      }),
                  PinterestButton(
                      icon: Icons.supervised_user_circle,
                      onPressed: () {
                        if (kDebugMode) {
                          print('Icon supervised_user_circle');
                        }
                      }),
                ],
              ),
              const Spacer(),
            ],
          )),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}
