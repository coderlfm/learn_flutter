import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final int totalCount; // 总的星星个数
  final double score; // 当前分数
  final int totalScore; // 总分
  final double size; // 每个星星的尺寸
  final Color unSelectedColor; // 未选中的星星颜色
  final Color selectedColor; // 选中的星星颜色

  Star({
    Key? key,
    this.totalCount = 5,
    required this.score,
    required this.totalScore,
    this.size = 30,
    Color? selectedColor,
    Color? unSelectedColor,
  })  : this.selectedColor = selectedColor ?? Colors.red,
        this.unSelectedColor = unSelectedColor ?? Colors.grey[300]!,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // 未选中的星
    final unStar = List.generate(totalCount, (index) => Icon(Icons.star, size: size, color: unSelectedColor));

    // 选中的星
    final List<Widget> higStar = [];

    final grade = totalScore / totalCount; // 得到每一个星星的分数
    final starCout = (score / grade); // 用分数除以每个星星所占的个数，得到需要点亮的星星个数
    final starCoutInt = starCout.floor();

    Icon higStarWidget = Icon(Icons.star, size: size, color: selectedColor);

    higStar.addAll(List.generate(starCoutInt, (index) => higStarWidget));

    final width = (starCout - starCoutInt) * size;
    higStar.add(ClipRect(clipper: RectStar(width), child: higStarWidget));

    return Stack(
      children: [Row(mainAxisSize: MainAxisSize.min, children: unStar), Row(mainAxisSize: MainAxisSize.min, children: higStar)],
    );
  }
}

class RectStar extends CustomClipper<Rect> {
  final double width;

  RectStar(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(RectStar oldClipper) {
    // 重新裁剪的条件
    return oldClipper.width != width;
  }
}
