import 'package:flutter/material.dart';
import './detail.dart';
import '../routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页'), leading: Container()),
      body: Center(
        child: Column(
          children: [
            Text('首页'),
            ElevatedButton(
              onPressed: () async {
                // 匿名路由的方式跳转
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => DetailPage(),
                //   settings: RouteSettings(arguments: {'id': '8000'}),
                // ));

                // 命名路由跳转传参，可以等待返回的结果
                final res = await Navigator.of(context).pushNamed(AppRouterName.detail, arguments: {"id": '3306'});
                print('接收到的结果 $res');
              },
              child: Text('进入详情'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/goodsDetail');
              },
              child: Text('跳转到详情页'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/ohter'),
              child: Text('跳转其它的页面'),
            )
          ],
        ),
      ),
    );
  }
}
