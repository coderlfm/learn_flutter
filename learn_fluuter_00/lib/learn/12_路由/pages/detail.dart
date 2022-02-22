import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final params = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    // 捕捉返回事件
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop('用户已操作完毕');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('详情页')),
        body: Container(
          child: Text('详情页 商品id：${params['id']}'),
        ),
      ),
    );
  }
}
