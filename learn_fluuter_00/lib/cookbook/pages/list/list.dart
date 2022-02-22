import 'package:flutter/material.dart';
import 'package:learn_fluuter_00/cookbook/extensions/double.dart';
import 'package:learn_fluuter_00/cookbook/extensions/int.dart';
import 'package:learn_fluuter_00/cookbook/model/category.dart';
import 'package:learn_fluuter_00/cookbook/routes/index.dart';
import 'package:learn_fluuter_00/cookbook/store/foods.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cate = ModalRoute.of(context)!.settings.arguments as CategoryItem;

    return Scaffold(
      appBar: AppBar(title: Text(cate.title)),
      body: buildContent(context, cate),
    );
  }

  Widget buildContent(BuildContext context, CategoryItem cate) {
    final foods = context.watch<FoodsStore>().getFoodsByCateId(cate.id);

    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (ctx, index) {
        final food = foods[index];

        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRouterName.detail, arguments: food);
          },
          child: Card(
            margin: EdgeInsets.all(20.rpx),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.rpx), topRight: Radius.circular(30.rpx)),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30.rpx), topRight: Radius.circular(30.rpx)),
                      child: Image.network(food.imageUrl),
                    ),
                    Positioned(
                      right: 30.rpx,
                      bottom: 40.rpx,
                      child: Text(
                        food.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white, backgroundColor: Colors.black45),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.schedule), Text('${food.duration} 分钟')],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.restaurant), Text('${food.complexity}')],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.favorite), Text('已收藏')],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
