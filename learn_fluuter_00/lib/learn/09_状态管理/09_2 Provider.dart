import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() => runApp(
      // 全局只有一个状态
      // ChangeNotifierProvider(
      //   create: (ctx) => CounterStore(),
      //   child: MyApp(),
      // ),
      // 全局拥有多个需要共享的状态 MultiProvider
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => CounterStore()),
          ChangeNotifierProvider(create: (ctx) => TokenStore()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

// 编写需要共享的状态
class CounterStore extends ChangeNotifier {
  int _counter = 0;

  set counter(int newCounter) {
    _counter = newCounter;
    notifyListeners(); // 设置的时候需要发送通知
  }

  // 该名称为使用时的名称，
  int get counter => _counter;
}

// 全局状态2
class TokenStore extends ChangeNotifier {
  String _token = ''; // 内部的

  String get token => _token;

  set token(newToken) {
    _token = newToken;
    notifyListeners();
  }

  // 修改token
  void changeToken(String newToken) => token = newToken;
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    // 获取全局方式 5
    // 在 生命周期 组件构建完成的下一帧 请求数据存入全局 store，如果直接直接存会报错，文档有对应说明
    Future.microtask(() => context.read<TokenStore>().changeToken('newToken 12532535'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Child1(),
            Child2(),
          ],
        ),
      ),
      // 获取全局状态 方式 2-1，优化：状态更新时不重新构建 child
      // floatingActionButton: Consumer2<CounterStore, TokenStore>(
      //   builder: (context, value, value2, child) {
      //     return FloatingActionButton(
      //       onPressed: () => value.counter += 1,
      //       child: child, // 不会重新构建 icon
      //     );
      //   },
      //   child: Icon(Icons.change_circle_outlined)
      // ),
      // 获取全局状态 方式 3，不对状态进行依赖(状态更新时 组件不会重新构建)
      floatingActionButton: Selector<CounterStore, CounterStore>(
        selector: (p0, p1) => p1,
        shouldRebuild: (prev, next) => false, // 状态更新时不重新构建依赖
        builder: (context, value, child) {
          print('重新 构建'); // 只有第一次会打印，后续更新状态不会打印
          return FloatingActionButton(
            onPressed: () => value.counter += 1,
            child: Icon(Icons.change_circle_outlined), // 不会重新构建 icon
          );
        },
      ),
    );
  }
}

class Child1 extends StatelessWidget {
  const Child1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取全局状态 方式 1，状态更新会重新执行 build 方法
    final counter = Provider.of<CounterStore>(context, listen: false).counter; // 获取 全局的状态

    print('重新build');

    return Container(color: Colors.red, child: Text('child1: $counter'));
  }
}

class Child2 extends StatelessWidget {
  const Child2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        // 获取全局状态 方式 2
        child: Column(
          children: [
            Consumer<CounterStore>(builder: (context, value, child) => Text('child2: ${value.counter} ')),
            // Consumer<TokenStore>(builder: (context, value, child) => Text('child2: ${value.token}')),
            // 获取全局方式 4
            Text('token: ${context.watch<TokenStore>().token}'),
            Text('token: ${context.select((value) => value)}')
          ],
        ));
  }
}
