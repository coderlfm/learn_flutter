// To parse this JSON data, do
//
//     final categoryItem = categoryItemFromMap(jsonString);

import 'package:flutter/material.dart';
import 'dart:convert';

CategoryItem categoryItemFromMap(String str) => CategoryItem.fromMap(json.decode(str));

String categoryItemToMap(CategoryItem data) => json.encode(data.toMap());

class CategoryItem {
  CategoryItem({
    required this.id,
    required this.title,
    required this.color,
    required this.finalColor,
  });

  final String id;
  final String title;
  final String color;
  final Color finalColor;

  factory CategoryItem.fromMap(Map<String, dynamic> json) {

    // 先转换为 16进制
    int finalColor = int.parse(json['color'], radix: 16);

    // 再加上透明度
    finalColor = finalColor | 0xff000000;

    return CategoryItem(id: json["id"], title: json["title"], color: json["color"], finalColor: Color(finalColor));
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "color": color,
      };
}
