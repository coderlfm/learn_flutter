import '../utils/hot_size.dart';

// 扩展 int
extension intHotSize on int {
  double get rpx => HotSize.setRpx(this.toDouble());
  double get px => HotSize.setPx(this.toDouble());
}