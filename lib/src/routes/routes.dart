import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:themes_app/src/pages/pages.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', const SlideshowPage()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergencia', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', const HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Cuadro animado',
      const CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Circulo de progreso',
      const GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest Layout', const PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverListPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
