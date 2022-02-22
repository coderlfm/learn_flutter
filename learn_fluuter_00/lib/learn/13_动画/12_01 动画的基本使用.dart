import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

/*
  动画 前置条件
  1. StatefulWidget
  2. 混入 SingleTickerProviderStateMixin
 */
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation curvedAnimation;
  late Animation<double> tween;

  @override
  void initState() {
    super.initState();

    // 1. 创建 动画 controller
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));

    // 2. 创建动画速率
    curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.linear);

    // 3. 创建动画过渡值
    tween = Tween(begin: 50.0, end: 100.0).animate(curvedAnimation);

    // 4.1 开启动画
    animationController.forward();

    // 4.2 监听动画改变
    animationController.addListener(() {
      setState(() {});
    });

    // 4.3 监听动画状态改变
    animationController.addStatusListener((status) {
      switch (status) {
        // 监听动画完成
        case AnimationStatus.completed:
          animationController.reverse();
          break;

        // 监听动画停止
        case AnimationStatus.dismissed:
          animationController.forward();
          break;
        default:
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('执行build 方法');

    return Scaffold(
      body: Center(
        child: Listener(
          onPointerUp: (e) {
            // 点击时 动画停止，再次点击动画继续
            if (animationController.isAnimating) {
              animationController.stop();
            } else {
              if (animationController.status == AnimationStatus.forward)
                animationController.forward();
              else
                animationController.reverse();
            }
          },
          /* child: Icon(
            Icons.favorite,
            color: Colors.red[400],
            size: tween.value, // 使用动画变化的值
          ),*/
          // 优化 1
          // child: IconAnimation(tween),

          // 优化 2
          child: AnimatedBuilder(
            animation: animationController,
            builder: (ctx, child) {
              return Icon(
                Icons.favorite,
                color: Colors.red[400],
                size: tween.value, // 使用动画变化的值
              );
            },
          ),
        ),
      ),
    );
  }
}

// 优化1 抽离动画widget，当值发生改变时重新构建 widget
class IconAnimation extends AnimatedWidget {
  const IconAnimation(Animation anim) : super(listenable: anim);

  Animation<double> get _size => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite,
      color: Colors.red[400],
      size: _size.value, // 使用动画变化的值
    );
  }
}
