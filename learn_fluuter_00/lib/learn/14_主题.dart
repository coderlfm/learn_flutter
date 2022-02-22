import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

Color getButtonColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };

  // 如果是 interactiveStates 包含的状态，则返回红色
  if (states.any((element) => interactiveStates.contains(element))) {
    return Colors.red[600]!;
  }
  return Colors.red;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        // 亮色，暗色 模式
        brightness: Brightness.dark,

        // primaryColor: Colors.green,
        // 主色调
        primarySwatch: Colors.red,

        // 按钮主题
        buttonTheme: ButtonThemeData(minWidth: 20, height: 10, buttonColor: Colors.amber),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(getButtonColor),
              // 配置按钮最小宽高
              minimumSize: MaterialStateProperty.all(Size(25, 20))),
        ),

        textTheme: TextTheme(
          // app 默认的文字大小
          bodyText2: TextStyle(fontSize: 14),

          bodyText1: TextStyle(fontSize: 16),

          // h1
          headline1: TextStyle(fontSize: 96),
          headline2: TextStyle(fontSize: 60),

          button: TextStyle(color: Colors.green),
        ),
      ),

      // 暗黑模式下的主题，实战中会将主题单独抽离
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white38,
      ),
      // themeMode: ThemeMode,
    );
  }
}

// 首页
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('主题配置')),
      body: Center(
        child: Column(
          children: [
            Text('h1标题', style: Theme.of(context).textTheme.headline1),
            Text('h2标题', style: Theme.of(context).textTheme.headline2),
            Text('h2标题 修改颜色', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.green)),
            Text('默认字体'),
            Text('默认字体 body1', style: Theme.of(context).textTheme.bodyText1),
            ElevatedButton(onPressed: () {}, child: Text('按钮')),
            Switch(value: true, onChanged: (val) {}),
            CupertinoSwitch(value: true, onChanged: (val) {})
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      // body: Text('home'),
    );
  }
}
