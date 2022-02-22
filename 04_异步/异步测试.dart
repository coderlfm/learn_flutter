import 'dart:io';

main(List<String> args) {
  // 捕捉成功，失败的回调
  /*  getDataFuture()
      .then((value) {
        print(value);
        return Future.value('2');
      })
      .catchError((error) {
        print('error: $error');
      })
      .whenComplete(() => print('无论成功还是失败都会执行'))
      .then((value) => print(value)); */

  getDataAsync().then((value) => print(value)).catchError((err) => print(err));
}

// Future 的基本使用
Future<String> getDataFuture() {
  return Future.value('success');

  return Future.error('error inifo');

  return Future.delayed(Duration(seconds: 2), () => '异步获取数据');
}

Future<String> getDataAsync() async {
  try {
    final res1 = await Future.delayed(Duration(seconds: 1), () => '第一个返回值');
    print(res1);

    final res2 = await Future.delayed(Duration(seconds: 1), () => '第二个返回值');
    print(res2);

    final err1 = await Future.error('error info');
  } catch (err) {
    print('捕获错误：$err');
  }

  return '最终的返回值';
}
