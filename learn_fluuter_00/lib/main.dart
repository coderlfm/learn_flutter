import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'calendar/home.dart';

main() => initializeDateFormatting().then((_) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HotSize.init();

    return MaterialApp(debugShowCheckedModeBanner: false, home: CalendarHomePage());
  }
}

class HotSize {
  static double standardSize = 750; // 设计稿尺寸

  static double physicalWidth = 0; // 物理宽度
  static double physicalHeight = 0; // 物理高度
  static double dpr = 2; // 缩放比例

  static double width = 0; // 逻辑宽度
  static double height = 0; // 逻辑高度

  static double tabHeight = 0; // 头部状态栏高度

  static double rpx = 0; // rpx
  static double px = 0; // px

  static init() {
    // 获取物理宽高
    physicalWidth = window.physicalGeometry.width;
    physicalHeight = window.physicalGeometry.height;

    // 获取 dpr
    dpr = window.devicePixelRatio;

    // 计算逻辑宽高
    width = physicalWidth / dpr;
    height = physicalHeight / dpr;

    tabHeight = window.padding.top;

    rpx = width / standardSize;
    px = width / standardSize * 2;
  }

  // 设置 rpx
  double setRpx(double size) => size * rpx;
  double setRx(double size) => size * px;
}

// 首页
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('屏幕')),
      body: Center(
        child: Container(
          width: HotSize().setRpx(750),
          height: HotSize().setRpx(300),
          color: Colors.green,
        ),
      ),
      // body: Text('home'),
    );
  }
}
