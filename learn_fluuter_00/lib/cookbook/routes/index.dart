import 'package:flutter/material.dart';
import '../pages/home/home.dart';
import '../pages/list/list.dart';
import '../pages/detail/detail.dart';
import '../pages/favorite/favorite.dart';
import '../app.dart';

class AppRouterName {
  // 初始化页面
  static final initialRoute = '/';
  static const home = '/home';
  static const list = '/list';
  static const detail = '/detail';
  static const favorite = '/favorite';
}

class AppRouteConfig {
  static final Map<String, WidgetBuilder> routes = {
    AppRouterName.initialRoute: (ctx) => App(),
    AppRouterName.home: (ctx) => HomePage(),
    AppRouterName.list: (ctx) => ListPage(),
    AppRouterName.detail: (ctx) => DetailPage(),
    AppRouterName.favorite: (ctx) => FavoritePage(),
  };

  static final RouteFactory onGenerateRoute = (settings) {};

  static final RouteFactory onUnknownRoute = (settings) {};
}
