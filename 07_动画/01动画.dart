
import 'dart:indexed_db';

Animation(抽象类)
  监听动画值的改变
  监听动画状态的改变
  value status·

前置条件
  1. 当前类是 statefulWidget
  2.当前类混入 SingleTickerProvierStateMixin

1.
initState 中
controller = AnimationController
  vsync: this 接受同步信号 程序退到后台可以不进行绘制
  Duration: 
  // 只能设置 0 — 1 区间 
  lowerBound: 开始值
  upperBound: 结束值

// 监听值的改变
controller.addListener((){
  setState((){}); // 直接空函数强制刷新
})

controller.addStatusListnner((status){
  // setState();
  status === xx.completed
    controller.rever()

  else if status === 
    controller.forword()
})

      controller.isAnimating 判断是否正在执行
点击时 controller.forward(); 启动动画  
      controller.stop();
2.
animation = CurvedAnimation: 设置动画的速碌 贝塞尔曲线
  panrent: controller,curve:Curves.xxx 

3.
valueAnimation Tween：设置 动画 value 的范围
  begin: 100, end: 200

  .animate(animation)

4.
dispose 中调用 controller.dispose()

优化

AnimatedWidget
  当 指定的值发生改变时，重新构建 weidget
  将需要动画的 组件抽出去 且继承 AnimatedWidget 且子类必须调用构造函数 super(listenable: anim)
  const IconAnimation(Animation anim) : super(listenable: anim);
  Animation<double> get _size => listenable as Animation<double>; // 需要手动指定一下值类型
  
AnimatedBuilder 优化
  controller：controller
  bilder
  child: Icon()


// 交织动画
// 如： 旋转 和缩放同时进行

Opacity 透明度
Transform(
  transform
  alignment: Matrix4.center
  child: XXX()
)

ColorTween() 颜色的 tween


// Hero 动画
图片地址
picsum.photos



路由跳转
跳转时从底部弹出
MaterialPageRoute(
  fullscreenDialog:true // ios 路由从底部弹出
)

// 路由转场动画
PageRouteBuilder()
  transaction: Transaction
  pageBuilder:(ctx,aniamtion1,anmation2){
    return FadeTraansition(
      opacity: animation1,
      child: xxxPage(),
    )
  }

如果是 pushNamed 需要捕捉路由跳转的方式加上动画
i.picsum.photos/id/  获取图片的网站

监听图片点击 GestureDetector 然后跳转的路由页面接受到 imgUrl (构造函数或者 路由的方式接受值)

例如 首页的商品列表 和 商品详情页的过渡动画， 路由跳转的方式最好通过 PageRoueBuilder 设置渐变的方式

给 lits 的img 和 详情页的 img都包裹一个 Hero() 标签，且设置相同的 tag ，一般为 imgUrl 


// 适配暗黑模式

theme:
darkTheme:
