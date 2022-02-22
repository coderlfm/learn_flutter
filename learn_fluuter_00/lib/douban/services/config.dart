class Config {
  static const baseUrl = 'https://m.douban.com/rexxar/api/v2/';
  // static const baseUrl = 'https://httpbin.org/';
  // static const baseUrl = 'http://localhost:8008/';
  static const timeout = 10000;
  static const method = 'GET';

  static const Map<String, dynamic> headers = {
    'Referer': 'https://m.douban.com/subject_collection/ECWY6B2GQ?dt_dapp=1',
  };
}
