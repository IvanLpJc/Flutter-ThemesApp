import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themes_app/src/themes/theme.dart';

import 'package:themes_app/src/widgets/slideshow.dart';

import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // backgroundColor: Colors.purple,
        // body: MiSlideshow(),
        body: Column(
      children: <Widget>[
        Expanded(child: MiSlideshow()),
        Expanded(child: MiSlideshow())
      ],
    ));
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final colorPrimario = appTheme.darkTheme
        ? appTheme.currentTheme.colorScheme.secondary
        : const Color(0xffFF5A7E);

    return Slideshow(
      bulletPrimario: 20,
      bulletSecundario: 12,
      // puntosArriba: true,
      colorPrimario: colorPrimario,
      // colorSecundario: Colors.red,
      slides: <Widget>[
        SvgPicture.asset(
          'assets/svgs/slide-1.svg',
        ),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
