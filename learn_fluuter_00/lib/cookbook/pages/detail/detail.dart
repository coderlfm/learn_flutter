import 'package:flutter/material.dart';
import 'package:learn_fluuter_00/cookbook/model/food.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as FoodItem;

    return Scaffold(
      appBar: AppBar(title: Text(food.title)),
      body: Center(
        child: Text(food.title),
      ),
    );
  }
}
