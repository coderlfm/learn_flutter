import 'package:flutter/material.dart';

import 'package:learn_fluuter_00/pages/home.dart';
import 'package:learn_fluuter_00/pages/about.dart';
import 'package:learn_fluuter_00/pages/detail.dart';

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
