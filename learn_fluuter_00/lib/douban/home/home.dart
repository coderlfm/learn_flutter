import 'package:flutter/material.dart';
import 'package:learn_fluuter_00/douban/model/home_model.dart';
import 'package:learn_fluuter_00/douban/services/home_request.dart';
import 'package:learn_fluuter_00/widgets/star/dash_line.dart';
import 'package:learn_fluuter_00/widgets/star/star.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HotMoiveItem> moiveList = [];

  @override
  void initState() {
    super.initState();

    HomeRequest.getHotMoive().then((res) {
      setState(() => moiveList.addAll(res));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: ListView.builder(
        itemCount: moiveList.length,
        itemBuilder: (ctx, index) {
          final moive = moiveList[index];
          return Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 15))),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRanking(index + 1),
                  SizedBox(height: 8),
                  buildContent(moive),
                  buildFooter(moive),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // 构建底部
  Container buildFooter(HotMoiveItem moive) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(2)),
      child: Text('${moive.rating.count}评价', style: TextStyle(color: Colors.grey[700])),
    );
  }

  // 构建内容
  Widget buildContent(HotMoiveItem moive) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 封面图
          ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.network(moive.coverUrl, width: 85)),
          SizedBox(width: 10),
          buildContentInfo(moive), // 中间的内容

          // 虚线分割线
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: DashLine(axis: Axis.vertical, count: 20, height: 2, width: 1)),

          // 想看
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/assets/images/douban/icons/love.png', width: 20),
              SizedBox(height: 5),
              Text('想看', style: TextStyle(color: Colors.orange, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  // 构建内容 info
  Expanded buildContentInfo(HotMoiveItem moive) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题
          Text.rich(TextSpan(children: [
            WidgetSpan(child: Icon(Icons.play_circle_outline_rounded, color: Colors.red[500])),
            WidgetSpan(child: SizedBox(width: 3)),
            TextSpan(text: moive.title, style: TextStyle(fontSize: 18))
          ])),
          SizedBox(height: 3),

          // 评分星星
          Row(
            children: [
              Star(
                  score: moive.rating.value,
                  totalScore: moive.rating.max,
                  size: 17,
                  selectedColor: Colors.orange[400]!),
              SizedBox(width: 5),
              Text('${moive.rating.value}', style: TextStyle(color: Colors.orange[500], fontSize: 16))
            ],
          ),
          SizedBox(height: 2),

          // card标题
          Text(moive.cardSubtitle, style: TextStyle(color: Colors.grey[600]))
        ],
      ),
    );
  }

  // 构建头部排名
  Widget buildRanking(int ranking) {
    Color getColor() {
      switch (ranking) {
        case 1:
          return Colors.red[400]!;
        case 2:
          return Colors.orange[700]!;
        case 3:
          return Colors.orange[300]!;
        default:
          return Colors.grey;
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: getColor()),
      child: Text('No.$ranking', style: TextStyle(color: Colors.white)),
    );
  }
}
