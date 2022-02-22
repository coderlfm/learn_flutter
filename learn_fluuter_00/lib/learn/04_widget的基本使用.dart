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
    // 字体图标本质
    return Column(
      children: [
        Icon(Icons.favorite),
        Text(
          '\ue25b',
          style: TextStyle(fontFamily: 'MaterialIcons'),
        )
      ],
    );

    // 按钮边距问题
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('按钮1'),
          //  默认为 MaterialTapTargetSize.padded 如果没有48px则会设置为 48px
          style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text('按钮2')),
      ],
    );

    // 按钮圆角
    return ElevatedButton(
      onPressed: () {},
      child: Text('按钮圆角'),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
      ),
    );

    // 占位图，懒加载
    return FadeInImage(
        placeholder: AssetImage('lib/assets/images/img2.png'),
        image: NetworkImage(
            'https://i0.hdslb.com/bfs/feed-admin/dc3bd50b91e867972852f08756243de860775097.jpg@336w_190h_1c.webp')
    );

    // 图片 设置大小及裁切方式
    return Image.asset('lib/assets/images/footer-img.jpg');

    return Image.network(
      'https://i0.hdslb.com/bfs/feed-admin/dc3bd50b91e867972852f08756243de860775097.jpg@336w_190h_1c.webp',
      width: 200,
      height: 200,
      fit: BoxFit.fitWidth,
      alignment: Alignment(1, 1),
    );

    // Row Column 设置为由内容撑开
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Text('1111'), Text('2222')],
      ),
    );

    // 富文本
    return Text.rich(TextSpan(children: [
      TextSpan(text: 'hello', style: TextStyle(color: Colors.red)),
      WidgetSpan(
          child: Icon(
            Icons.delete,
            color: Colors.amber,
          )),
      TextSpan(text: 'world', style: TextStyle(color: Colors.green)),
    ]));

    // 2行省略号
    return Text(
      '文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1文字1',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

// 输入框，通过按钮来获取输入框的值
class FormContent extends StatelessWidget {

  final usernameField = TextEditingController();
  final passwordField = TextEditingController();

  void handleSubmit(){
    print('username: ${usernameField.text} password: ${passwordField.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: usernameField,
          decoration: InputDecoration(
              labelText: 'username',
              icon: Icon(Icons.account_circle),
              border: OutlineInputBorder(),
              hintText: '请输入用户名'),
        ),
        TextField(
          controller: passwordField,
          decoration: InputDecoration(labelText: 'password', icon: Icon(Icons.lock)),
        ),
        Container(
            width: 200,
            margin: EdgeInsets.only(top: 10),
            child: ElevatedButton(onPressed: handleSubmit, child: Text('提交')))
      ],
    );
  }
}
