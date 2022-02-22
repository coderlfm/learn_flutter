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

// StatelessWidget 练习
class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeItem('标题', '描述',
            'https://i0.hdslb.com/bfs/feed-admin/dc3bd50b91e867972852f08756243de860775097.jpg@336w_190h_1c.webp'),
        HomeItem('标题', '描述',
            'https://i0.hdslb.com/bfs/feed-admin/dc3bd50b91e867972852f08756243de860775097.jpg@336w_190h_1c.webp'),
        HomeItem('标题', '描述',
            'https://i0.hdslb.com/bfs/feed-admin/dc3bd50b91e867972852f08756243de860775097.jpg@336w_190h_1c.webp'),
        HomeItem('标题', '描述', 'https://i0.hdslb.com/bfs/sycp/creative_img/202112/0e2bd46d2c068ce3066ad3a349b9bdbd.jpg'),
        HomeItem('标题', '描述',
            'https://i0.hdslb.com/bfs/feed-admin/dc3bd50b91e867972852f08756243de860775097.jpg@336w_190h_1c.webp'),
      ],
    );
  }
}

// https://i0.hdslb.com/bfs/feed-admin/dc3bd50b91e867972852f08756243de860775097.jpg@336w_190h_1c.webp
class HomeItem extends StatelessWidget {
  final String title;
  final String desc;
  final String url;

  const HomeItem(this.title, this.desc, this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 10, color: Colors.green)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          Text(desc),
          SizedBox(
            height: 10,
          ),
          Image.network(url)
        ],
      ),
    );
  }
}

class HomeStatefulWidget extends StatefulWidget {
  const HomeStatefulWidget({Key? key}) : super(key: key);

  @override
  _HomeStatefulWidgetState createState() => _HomeStatefulWidgetState();
}

class _HomeStatefulWidgetState extends State<HomeStatefulWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red)),
                onPressed: () {
                  setState(() => _counter--);
                },
                child: Icon(Icons.exposure_minus_1)),
            ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green)),
                onPressed: () {
                  setState(() => _counter++);
                },
                child: Icon(Icons.add))
          ],
        ),
        Text('当前计数$_counter')
      ],
    );
  }
}

