import 'package:flutter/cupertino.dart';
import 'package:learn_fluuter_00/cookbook/model/food.dart';
import 'package:learn_fluuter_00/cookbook/services/list.dart';

class FoodsStore extends ChangeNotifier {
  List<FoodItem> _foods = [];

  FoodsStore() {
    ListRequest.getFoods().then((res) => foods = res);
  }

  List<FoodItem> get foods => _foods;

  set foods(List<FoodItem> value) {
    _foods = value;
    notifyListeners();
  }

  // 通过分类 id 获取起对应菜
  List<FoodItem> getFoodsByCateId(String cateId) {
    return foods.where((item) => item.categories.contains(cateId)).toList();
  }
}
