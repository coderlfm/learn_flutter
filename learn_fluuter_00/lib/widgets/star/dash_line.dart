import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  final Axis axis; // 方向
  final int count; // 总的分割线格式
  final double width; // item 的宽度
  final double height; // item 的高度
  final Color color; // item 的颜色

  const DashLine({
    Key? key,
    this.axis = Axis.horizontal,
    this.count = 20,
    this.width = 5,
    this.height = 1,
    this.color = Colors.black26,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        count,
        (_) => SizedBox(
          width: width,
          height: height,
          child: DecoratedBox(decoration: BoxDecoration(color: color)),
        ),
      ),
    );
  }
}
