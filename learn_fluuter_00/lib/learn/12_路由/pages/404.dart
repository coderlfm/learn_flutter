import 'package:flutter/material.dart';
import '../routes/routes.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('找不到页面')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('你迷路了'),
            ElevatedButton(
              onPressed: () => Navigator.of(context).popAndPushNamed(AppRouterName.home),
              child: Text('回到首页'),
            ),
          ],
        ),
      ),
    );
  }
}
