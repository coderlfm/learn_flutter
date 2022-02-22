import 'package:learn_fluuter_00/cookbook/model/category.dart';

import './request.dart';

class HomeRequest {
  static Future<List<CategoryItem>> getCategory() async {
    final res = await Request.request('/category.json');
    return List<CategoryItem>.from(res['category'].map((x) => CategoryItem.fromMap(x)));
  }
}
