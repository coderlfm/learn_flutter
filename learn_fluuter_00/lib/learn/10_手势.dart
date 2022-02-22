import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('手势监听')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            print('父点击');
          },
          child: Container(
            color: Colors.red,
            width: 300,
            height: 300,
            alignment: Alignment.center, // 会套一个 Align
            // 如果直接嵌套 Container 时，内部的 Container 会占满父的宽高，需要用一个容器进行隔离
            child: GestureDetector(
              onTap: () {
                print('子点击');
              },
              onLongPress: () {
                print('长按');
              },
              child: Container(width: 200, height: 200, color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}

// 测试 Listener
class TestListener extends StatelessWidget {
  const TestListener({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (event) {
        // Offset(192.3, 451.6) 能够获取到距离屏幕左边的距离
        print('父点击$event');
      },
      child: Container(
        color: Colors.red,
        width: 300,
        height: 300,
        alignment: Alignment.center, // 会套一个 Align
        // 如果直接嵌套 Container 时，内部的 Container 会占满父的宽高，需要用一个容器进行隔离
        child: Listener(
          onPointerUp: (event) {
            print('子点击${event.position}');
          },
          child: Container(width: 200, height: 200, color: Colors.green),
        ),
      ),
    );
  }
}
