import 'package:flutter/material.dart';
import 'package:learn_fluuter_00/cookbook/model/category.dart';
import 'package:learn_fluuter_00/cookbook/routes/index.dart';
import 'package:learn_fluuter_00/cookbook/services/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('美食广场')),
      body: FutureBuilder<List<CategoryItem>>(
        future: HomeRequest.getCategory(),
        builder: (ctx, res) {
          if (!res.hasData) return Center(child: CircularProgressIndicator());
          if (res.hasError) return Center(child: Text('网络超时'));

          return buildContent(res, context);
        },
      ),
    );
  }

  // 构建 分类 content
  GridView buildContent(AsyncSnapshot<List<CategoryItem>> res, BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      itemCount: res.data!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (ctx, index) {
        final cate = res.data![index];
        return buildCategoryItem(cate, context);
      },
    );
  }

  // 构建 分类 item
  Widget buildCategoryItem(CategoryItem cate, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRouterName.list, arguments: cate);
      },
      child: Container(
        key: ValueKey(cate.id),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [cate.finalColor.withOpacity(.5), cate.finalColor]),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(child: Text(cate.title, style: Theme.of(context).textTheme.headline6)),
      ),
    );
  }
}
