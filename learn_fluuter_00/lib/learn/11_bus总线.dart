import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

// 创建全局事件总线，可以抽离到单独的文件中
final eventBus = EventBus();

// 事件类型
class UserChnageEvent {
  String username;
  int age;

  UserChnageEvent(this.username, this.age);
}

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
      appBar: AppBar(title: Text('bus 总线')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Child1(),
            Child2(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('发出事件'),
        onPressed: () {
          eventBus.fire(UserChnageEvent('lfm', 20));
        },
      ),
    );
  }
}

class Child1 extends StatefulWidget {
  const Child1({Key? key}) : super(key: key);

  @override
  State<Child1> createState() => _Child1State();
}

class _Child1State extends State<Child1> {
  @override
  void initState() {
    super.initState();
    eventBus.on<UserChnageEvent>().listen((event) {
      print('child1 监听: ${event.username}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('child1'));
  }
}

class Child2 extends StatefulWidget {
  const Child2({Key? key}) : super(key: key);

  @override
  State<Child2> createState() => _Child2State();
}

class _Child2State extends State<Child2> {
  @override
  void initState() {
    super.initState();
    // 监听
    eventBus.on<UserChnageEvent>().listen((event) {
      print('child2 监听: ${event.username}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('child2'));
  }
}
