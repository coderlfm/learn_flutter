import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个 flutter 程序'),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 层叠布局
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network('https://i0.hdslb.com/bfs/feed-admin/dc3bd50b91e867972852f08756243de860775097.jpg@336w_190h_1c.webp'),
        Positioned(right: 0, bottom: 0, child: Container(width: 200, height: 100, color: Colors.amber,)),
        Positioned(left: 0, bottom: 0, child: Text('内容', style: TextStyle(fontWeight: FontWeight.bold),)),
      ],
    );

    // flex 占据剩余空间 Flexible fit:FlexFit.tight, 或者 Expanded
    return Row(
      children: [
        Flexible(fit:FlexFit.tight, child: Container(child: Text('第1个'), color: Colors.red,)),
        Expanded(child: Container(child: Text('第2个'), color: Colors.amber,)),
        Container(child: Text('第3个'), color: Colors.green,),
        Container(child: Text('第4个'), color: Colors.blue,),
      ],
    );

    // Container 的 color 和 decoration 有冲突，传了 decoration 时必须将 color也写入
    return Container(
      // color: Colors.amber,
        decoration: BoxDecoration(color: Colors.amber),
        transform: Matrix4.rotationZ(50),
        child: Align(
          child: Icon(Icons.favorite),
          widthFactor: 6,
          heightFactor: 6,
        )
    );


    // 通过包裹 Padding 设置paddingn， 或者可以包裹 Container 设置paddingn
    return Padding(
      padding: EdgeInsets.all(30),
      child: Icon(Icons.favorite),
    );

    // Center 的本质就是 Align
    // widthFactor 根据 等比放大子元素宽的倍数
    return Container(
        color: Colors.amber,
        child: Align(
          child: Icon(Icons.favorite),
          widthFactor: 6,
          heightFactor: 6,
        ));
    return Center(
      child: Icon(Icons.favorite),
    );
  }
}





