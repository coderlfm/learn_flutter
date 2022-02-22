import 'dart:isolate';

main(List<String> args) async {
  // 创建 Isolate
  Isolate.spawn(foo, 10);

  ReceivePort receivePort = ReceivePort();

  Isolate isolate = await Isolate.spawn<SendPort>(bar, receivePort.sendPort);

  receivePort.listen((message) {
    print('on: $message');

    receivePort.close();
    isolate.kill();
  });
}

void foo(int limit) {
  int sum = 0;
  for (int i = 0; i < limit; i++) {
    sum += i;
  }
  print('sum: $sum');
}

void bar(SendPort sendPort) {
  sendPort.send('message');
}
