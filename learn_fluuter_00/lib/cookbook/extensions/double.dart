import '../utils/hot_size.dart';

// 扩展 double
extension doubleHotSize on double {
  double get rpx => HotSize.setRpx(this.toDouble());
  double get px => HotSize.setPx(this.toDouble());
}
