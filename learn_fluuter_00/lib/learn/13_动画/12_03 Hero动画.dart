import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/home': (ctx) => HomePage(),
        // '/detail': (ctx) => DetailPage(),
      },
      initialRoute: '/home',
    );
  }
}

// 首页
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero 动画 首页')),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5, childAspectRatio: 16 / 9),
        itemBuilder: (ctx, index) {
          String url = 'https://picsum.photos/500/500?random=$index';

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                // 路由过渡动画
                PageRouteBuilder(
                  pageBuilder: (ctx, anim1, anim2) => FadeTransition(opacity: anim1, child: DetailPage(url: url)),
                ),
              );
            },
            child: Hero(tag: url, child: Image.network(url, height: 50,fit: BoxFit.cover)),
          );
        },
      ),
      // body: Text('home'),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String url;
  const DetailPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero 动画 详情页')),
      body: Hero(tag: url, child: Image.network(url)),
    );
  }
}
