import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:learn_fluuter_00/services/request.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();

  @override
  void initState() {
    super.initState();

    // dio.get('https://httpbin.org/get', queryParameters: {"name": "lfm"}).then((value) => print(value));
    getDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.get_app),
        onPressed: () {
          getDate();
        },
      ),
    );
  }
}

void getDate() {
  Request.request<dynamic>('get', queryParameters: {'xxx': 'yyy'}, method: 'get').then((res) => print('res: $res'));
}
