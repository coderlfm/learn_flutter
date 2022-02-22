import 'package:dio/dio.dart';
import './config.dart';

class Request {
  static final dio = Dio(
    BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: Config.timeout,
      method: Config.method,
      headers: Config.headers,
    ),
  );

  static Future request(String url, {Map<String, dynamic>? queryParameters, String? method}) async {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handle) {
        print('请求拦截: ${options.uri} ${options.headers}');
        return handle.next(options);
        // return options;
      },
      onResponse: (options, handle) {
        print('响应拦截');
        return handle.next(options);
      },
      onError: (options, handle) {
        print('错误拦截：$options');
        return handle.next(options);
      },
    ));

    Options options = Options(method: method);
    Response<dynamic> res;

    try {
      res = await dio.request(url, queryParameters: queryParameters, options: options);
    } catch (err) {
      print('请求发生错误$err');
      return Future.error(err);
    }
    return res.data;
  }
}
