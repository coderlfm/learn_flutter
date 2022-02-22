// To parse this JSON data, do
//
//     final foodItem = foodItemFromJson(jsonString);

import 'dart:convert';

const complexitys = ['简单', '中等', '困难'];

class FoodItem {
  FoodItem({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });

  final String id;
  final List<String> categories;
  final String title;
  final int affordability;
  final String complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  factory FoodItem.fromJson(String str) => FoodItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FoodItem.fromMap(Map<String, dynamic> json) => FoodItem(
        id: json["id"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        title: json["title"],
        affordability: json["affordability"],
        complexity: complexitys[json["complexity"]],
        imageUrl: json["imageUrl"],
        duration: json["duration"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        steps: List<String>.from(json["steps"].map((x) => x)),
        isGlutenFree: json["isGlutenFree"],
        isVegan: json["isVegan"],
        isVegetarian: json["isVegetarian"],
        isLactoseFree: json["isLactoseFree"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "title": title,
        "affordability": affordability,
        "complexity": complexity,
        "imageUrl": imageUrl,
        "duration": duration,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "isGlutenFree": isGlutenFree,
        "isVegan": isVegan,
        "isVegetarian": isVegetarian,
        "isLactoseFree": isLactoseFree,
      };
}
