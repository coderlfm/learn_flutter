import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './theme/themt.dart';

import './routes/index.dart';
import 'store/foods.dart';

main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => FoodsStore())],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouterName.initialRoute,
      routes: AppRouteConfig.routes,
      onGenerateRoute: AppRouteConfig.onGenerateRoute,
      onUnknownRoute: AppRouteConfig.onUnknownRoute,
      theme: globalTheme,
    );
  }
}
