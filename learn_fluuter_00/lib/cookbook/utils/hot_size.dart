import 'dart:ui';

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
  static double setRpx(double size) {
    if (rpx == 0) HotSize.init();
    return size * rpx;
  }

  static double setPx(double size) {
    if (px == 0) HotSize.init();
    return size * px;
  }
}
