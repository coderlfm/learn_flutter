// import 'dart:math' as Math;
import 'dart:math' show max hide min;

import 'module/index.dart';

main(List<String> args) {
  // dart 中默认一个文件就是 模块

  // dart:core 库不需要手动导入，如 print 方法

  // print(max(10, 20));

  // 起别名 import 'dart:math' as Math；
  // print(Math.max(10, 20));

  // show
  print(max(10, 20));

  // 统一导出
  sum01();
  sum02();

  /**
      1. 系统库 import 'dart:math'; dart:core 库不需要手动导入
      起别名 import 'dart:math' as Math；
      默认导入时会导入所有的公共属性和方法

      show/hide
        import 'dart:math' show sum, mul;

      统一导出 
      export 'xxxx/yyy.dart'
      
      pubspec.yaml 类似 package.json

      pub.dev
      pub get 类似于 npm install

      2.导入第三方库
      import 'package:xxx/yyy.dart'


   */
}
