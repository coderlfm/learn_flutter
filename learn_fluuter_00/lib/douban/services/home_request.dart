import 'package:learn_fluuter_00/douban/model/home_model.dart';

import 'request.dart';

class HomeRequest {
  // 获取 实时热门电影
  static Future<List<HotMoiveItem>> getHotMoive() async {
    final res = await Request.request('subject_collection/ECWY6B2GQ/items?start=0&count=50&updated_at=&items_only=1&for_mobile=1', method: 'GET');

    final originHotMoives = res['subject_collection_items'];
    final List<HotMoiveItem> hotMoives = [];

    for (var moive in originHotMoives) {
      hotMoives.add(HotMoiveItem.fromMap(moive));
    }

    // print('res: $res');

    return hotMoives;
  }
}
