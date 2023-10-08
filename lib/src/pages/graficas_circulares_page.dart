import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themes_app/src/themes/theme.dart';

import 'package:themes_app/src/widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                porcentaje += 10;
                if (porcentaje > 100) {
                  porcentaje = 0;
                }
              });
            }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgress(
                    porcentaje: porcentaje, color: Colors.blue),
                CustomRadialProgress(
                    porcentaje: porcentaje * 1.2, color: Colors.red)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgress(
                    porcentaje: porcentaje * 4, color: Colors.pink),
                CustomRadialProgress(
                    porcentaje: porcentaje * 6, color: Colors.purple)
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;

  const CustomRadialProgress(
      {super.key, required this.porcentaje, required this.color});

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return SizedBox(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: currentTheme.textTheme.bodyMedium!.color!,
        grosorPrimario: 10,
        grosorSecundario: 4,
      ),
      // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0) ),
    );
  }
}
