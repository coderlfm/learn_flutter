import 'dart:ui';

import 'package:flutter/material.dart';

// 扩展 int
extension intHotSize on int {
  double get rpx => HotSize.setRpx(this.toDouble());
  double get px => HotSize.setPx(this.toDouble());
}
// 扩展 double
extension doubleHotSize on double {
  double get rpx => HotSize.setRpx(this.toDouble());
  double get px => HotSize.setPx(this.toDouble());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HotSize.init();

    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
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
    physicalWidth = window.physicalGeometry.width;
    physicalHeight = window.physicalGeometry.height;

    dpr = window.devicePixelRatio;

    width = physicalWidth / dpr;
    height = physicalHeight / dpr;

    tabHeight = window.padding.top;

    rpx = width / standardSize;
    px = width / standardSize * 2;
  }

  // 设置 rpx
  static double setRpx(double size) => size * rpx;
  static double setPx(double size) => size * px;
}

// 首页
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('屏幕适配')),
      body: Center(
        child: Container(
          width: 750.rpx,
          height: 300.rpx,
          color: Colors.green,
        ),
      ),
      // body: Text('home'),
    );
  }
}