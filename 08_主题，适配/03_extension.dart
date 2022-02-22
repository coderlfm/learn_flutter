通过 extension 对类进行扩展

// 2.6 版本才支持
extendsion PersonE1 on Person{
 double get rpx {
   return HiseFix.setRpx(this.toDouble());
 } 
}