import 'package:flutter/material.dart';
import 'package:themes_app/src/pages/slideshow_page.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = const SlideshowPage();

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => _currentPage;
}
