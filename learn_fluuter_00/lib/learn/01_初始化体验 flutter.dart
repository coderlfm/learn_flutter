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
      // body: HomeContent(),
      body: HomeCheck(),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        'hello world',
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 30, color: Colors.amber),
      ),
    );
  }
}

class HomeCheck extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeCheckState();
  }
}

class HomeCheckState extends State<HomeCheck> {
  var flag = false;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
              value: flag,
              onChanged: (value) {
                setState(() {
                  flag = value!;
                });
              }),
          Text('同意协议'),
          ElevatedButton(onPressed: () {}, child: Text('按钮'))
        ],
      ),
    );
  }
}
