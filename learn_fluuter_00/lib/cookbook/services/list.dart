import 'package:learn_fluuter_00/cookbook/model/food.dart';
import './request.dart';

class ListRequest {
  static Future<List<FoodItem>> getFoods() async {
    final res = await Request.request('/food.json');
    return List<FoodItem>.from(res['food'].map((x) => FoodItem.fromMap(x)));
  }
}
