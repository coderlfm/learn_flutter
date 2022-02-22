/**

Dart 也是 单线程+时间循环

Futrue -> Promise

// sleep(seconds:20);

// 使用
Future((){
  return 'xxxx';
})
// 只有有return 就会执行 .then
res.then((dynamic value){

})

// 只要抛出错误, 必须和 then后面链式调用 就会执行 .catchError((Exception err) {});
throw Exception('错误信息')

.wenComplete(() {}); 类似于  finaly

.then 链式调用，.then 中直接 return 会被包装成 Future


Futrue.value('123').then()

Futrue.error('123').then()

Future.delayed().then()


/*******************/  

async
Future getData() async {
  var result = await getXXX();
  return result;
}

async 和 await 和前端的使用方式一致

需要注意 多次调用 await， 捕获异常时需要在当前函数的 catchError d捕获 ,
可以直接 try 
on DioError catch(e){ }

Dart 也有微任务队列

前端最好不要处理太复杂的数据
服务端一次性处理好，web端，android端，ios端都可以省去时间

Isolate

// 会启动一个单独的线程执行
Isolate.spawn(fn,args);
fn(args){ }

Isolate 中的通信

ReveivePort rexxx = ReveivePort();
Isolate = isolate = await  Isolate.spawn<SendPort>(fn, rexxx.sendPort);

rexxx.listen((message){
isolate.close();
isolate.kill();
});

fn(send){
  return send.message('12345');
}


// 双向通信
cpmpute 

// flutter 多线程

ui renner             GPU Runner IO Runner  Platfom
dart 代码运行在 ui 线程


发送网络请求
HttpClient 
http 库
dio

final dio = Dio();

https://httpbin.org/get
dio.get(url).then()

BaseInfo   抽离出一个类
Dio(BaseInfo)
Future<T> request<T>(url{ method, Map<String, dynamic> params}){


options = Options(method);

 Response res = await dio.request(url, queryParameters: params,options:options)

return res.data
}




 */