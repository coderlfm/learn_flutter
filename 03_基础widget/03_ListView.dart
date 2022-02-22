ListView
 itemExtent: 100
 scrollDirection: Axis.xxxxx
 controller: 设置滚动监听
 
List.generate(100,(index));  循环遍历
ListTile() 前置/后置 

// 准备展示的时候才会build
一般传入回调函数的时候会在即将 build 的时候才构建
List.builder(
  itemCounter:100,
  itemBuilder:(ctx,index){ 
    return widget;
  }
)

// 分割线
List.separated()
Divider(); 可以设置前置/后置偏移，高度等


GridView
GridView。counter
GridView.build
gridDelegate

  SliveGrid CrossCount  交叉轴个数
  maxCrossAxisExtent: 220 设置最大值

cross sapcing: 侧轴间距
main主轴间距

// 随机数
Random().nextInt(256);


自定义ScroolView

SafaArea 安全区域
SliverSafeArea 安全区域
SliverPadding padding
SliverAppBar
  pinned: true 可设置不可滚动

监听
Listxxx 
controller
ScrollController(initialScrollOffset: 300);
controller.addListener((){
  controller.offset
})  

controller.animateTo(0, duration)
回到顶部案例
无法监听 开始/结束 滚动

NotificationListener(
  onNotification: (ScrollController notification){
    开始滚动
    return true;
  }
)

is 操作符用来判断类型的

下拉刷新实现思路 Stack 下面放一个刷新的动画

