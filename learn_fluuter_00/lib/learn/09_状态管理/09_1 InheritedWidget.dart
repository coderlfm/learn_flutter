import 'package:flutter/material.dart';

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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username = 'flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: UserinfoState(
          username: username,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('需要共享的值：$username'), Child1(), Child2()],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {setState(() => (username = username == 'flutter' ? 'dart' : 'flutter'))},
        child: Icon(Icons.change_circle_outlined),
      ),
    );
  }
}

// 编写状态
class UserinfoState extends InheritedWidget {
  final String username; // 共享的数据

  UserinfoState({required Widget child, required this.username}) : super(child: child);

  static UserinfoState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(UserinfoState oldWidget) {
    // 当两个值不一致的返回 true ，会执行 didChangeDependencies() 方法
    return oldWidget.username != username;
  }
}

class Child1 extends StatelessWidget {
  const Child1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final username = UserinfoState.of(context).username;

    return Container(color: Colors.red, child: Text('child1: $username'));
  }
}

class Child2 extends StatelessWidget {
  const Child2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final username = UserinfoState.of(context).username;

    return Container(color: Colors.green, child: Text('child2: $username'));
  }
}
