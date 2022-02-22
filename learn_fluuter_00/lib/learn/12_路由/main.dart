import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/404.dart';
import './pages/detail.dart';
import './routes/routes.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouterName.INIT_PAGE,
      routes: appRouter,
      home: HomePage(),
      // 自定义返回，类似于导航守卫
      onGenerateRoute: (settings) {
        print('settings: $settings');

        switch (settings.name) {
          case '/goodsDetail':
            return MaterialPageRoute(
              builder: (ctx) => DetailPage(),
              settings: RouteSettings(arguments: {'id': '8000'}),
            );
        }
      },
      // 404 路由
      onUnknownRoute: (setting) => MaterialPageRoute(builder: (ctx) => UnknownPage()),
    );
  }
}
