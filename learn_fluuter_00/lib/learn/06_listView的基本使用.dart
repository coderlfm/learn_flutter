import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 监听滚动，初始化滚动距离
  final ScrollController _scrollController = ScrollController(initialScrollOffset: 200);
  bool showTop = false;

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print('开始滚动, 当前滚动距离${_scrollController.offset}');
    });
  }


  Widget buildBody(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification scrollNotification) {
        // 通过 is 关键字来判断所属类
        if (scrollNotification is ScrollStartNotification) {
          print('开始滚动');
        } else if (scrollNotification is ScrollUpdateNotification) {
          print('滚动中 当前滚动： ${scrollNotification.metrics.pixels}');
        } else if (scrollNotification is ScrollEndNotification) {
          print('结束滚动');
        }

        return true;
      },
      child: GridView.builder(
        itemCount: 100,
        // controller: _scrollController,
        // 设置交叉轴的 item 个数
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        // 通过 主轴 设置占据的最大值来设置 item
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100, mainAxisSpacing: 5, crossAxisSpacing: 5),
        itemBuilder: (BuildContext context, index) {
          return Container(
            width: 100,
            height: 100,
            color: Color.fromRGBO(
                Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), Random().nextInt(10) / 10),
          );
        },
      ),
    );

    // 安全区域内展示 和 外padding
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverSafeArea(
            sliver: SliverPadding(
          padding: EdgeInsets.all(5),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((BuildContext context, index) {
              return Container(
                width: 100,
                height: 100,
                color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
              );
            }, childCount: 50),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
          ),
        ))
      ],
    );

    // 同时使用 ListView 和 GridView, 自定义 ScrollView
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return ListTile(
            title: Text('联系人$index'),
            subtitle: Text('1777828617$index'),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.call_end),
          );
        }, childCount: 20)),
        SliverGrid(
            delegate: SliverChildBuilderDelegate((BuildContext context, index) {
              return Container(
                width: 100,
                height: 100,
                color: Color.fromRGBO(
                    Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), Random().nextInt(10) / 10),
              );
            }, childCount: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3))
      ],
    );

    // 自定义listView
    return ListView.custom(childrenDelegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Text('内容');
    }));

    // 网格 list 布局
    return GridView.builder(
      itemCount: 100,
      // 设置交叉轴的 item 个数
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      // 通过 主轴 设置占据的最大值来设置 item
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100, mainAxisSpacing: 5, crossAxisSpacing: 5),
      itemBuilder: (BuildContext context, index) {
        return Container(
          width: 100,
          height: 100,
          color: Color.fromRGBO(
              Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), Random().nextInt(10) / 10),
        );
      },
    );

    // ListView builder 性能更优
    return ListView.builder(
        itemCount: 50,
        itemExtent: 50,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('联系人$index'),
            subtitle: Text('1777828617$index'),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.call_end),
          );
        });

    // 分割线
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Text('内容$index');
        },
        separatorBuilder: (BuildContext context, int index) {
          // 分割线
          return Divider(
            color: Colors.green,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          );
        },
        itemCount: 100);

    // ListView 的基本使用
    return ListView(
      children: List.generate(100, (index) => Text('内容$index')),
    );

    return ListView(
      // 指定子元素的 宽或者高(根据展示的方向)，显示指定更有利于优化性能，
      itemExtent: 100,
      children: [
        Text('1'),
        Text('2'),
        Text('3'),
        Text('4'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('show $showTop');
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('List View 测试'),
      // ),
      body: buildBody(context),
      floatingActionButton: showTop
          ? FloatingActionButton(
              child: Icon(Icons.vertical_align_top),
              onPressed: () {
                // 回到顶部
                _scrollController.animateTo(0, duration: Duration(milliseconds: 600), curve: Curves.ease);
              },
            )
          : null,
    );
  }
}
