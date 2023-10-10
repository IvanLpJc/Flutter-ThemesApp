import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:themes_app/src/widgets/headers.dart';
import 'package:themes_app/src/widgets/boton_gordo.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge = MediaQuery.of(context).size.height > 550;

    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              duration: const Duration(milliseconds: 250),
              child: BotonGordo(
                icon: item.icon,
                texto: item.texto,
                color1: item.color1,
                color2: item.color2,
                onPress: () {
                  if (kDebugMode) {
                    print('hola');
                  }
                },
              ),
            ))
        .toList();

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: isLarge ? 200 : 0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              if (isLarge)
                const SizedBox(
                  height: 80,
                ),
              ...itemMap
            ],
          ),
        ),
        if (isLarge) _Encabezado()
      ],
    ));
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Médica',
          subtitulo: 'Has solicitado',
          color1: Color(0xff536CF6),
          color2: Color(0xff66A9F2),
        ),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
                onPressed: () {},
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15.0),
                child: const FaIcon(FontAwesomeIcons.ellipsisVertical,
                    color: Colors.white)))
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      icon: FontAwesomeIcons.carBurst,
      texto: 'Motor Accident',
      color1: const Color(0xff6989F5),
      color2: const Color(0xff906EF5),
      onPress: () {
        if (kDebugMode) {
          print('Click!');
        }
      },
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Haz Solicitado',
      titulo: 'Asistencia Médica',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
