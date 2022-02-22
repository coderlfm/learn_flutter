import 'package:flutter/material.dart';

import '../pages/home.dart';
import '../pages/about.dart';
import '../pages/detail.dart';

class AppRouterName {
  static const INIT_PAGE = '/home';

  static const home = '/home';
  static const detail = '/home/detail';
  static const about = '/about';
}

final Map<String, WidgetBuilder> appRouter = {
  AppRouterName.home: (ctx) => HomePage(),
  AppRouterName.detail: (ctx) => DetailPage(),
  AppRouterName.about: (ctx) => AboutPage(),
};
