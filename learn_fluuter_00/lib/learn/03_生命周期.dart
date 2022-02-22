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
      body: HomeStatefulWidget(),
    );
  }
}

class HomeStatefulWidget extends StatefulWidget {
  const HomeStatefulWidget({Key? key}) : super(key: key);

  @override
  _HomeStatefulWidgetState createState() => _HomeStatefulWidgetState();
}

class _HomeStatefulWidgetState extends State<HomeStatefulWidget> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _counter == 1 ? Test1() : Test2(),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _counter = _counter == 1 ? 2 : 1;
              });
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            ),
            child: Text('切换'))
      ],
    );
  }
}

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Test1 instate');
  }


  @override
  void didUpdateWidget(covariant Test1 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('Test1 didUpdateWidget');

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('Test1 didChangeDependencies');

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('Test1 dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Text('test1');
  }
}



class Test2 extends StatefulWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Test2 instate');
  }

  @override
  void didUpdateWidget(covariant Test2 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('Test2 didUpdateWidget');

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('Test2 didChangeDependencies');

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('Test2 dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Text('test2');
  }
}
