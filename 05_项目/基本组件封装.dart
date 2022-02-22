/**
 可修改项目启动入口
 点击顶部 main.dart 然后修改 Dart entrypoint 
 
 评分组件实现思路
 .floor() 向下取整

裁剪
ClipRact(
  clipper: 
)

xxx extends CustomClipper<Rect> {

  Rect getClip(Size size){
    left top right bottom
    return Rect.fromLTRB(0,0,width,size.height);
  }

  shoulReclip
  return old.width != this.width;

}

虚线组件封装
SizeBox
  child: DecorateBox(color: color); box的背景色

images/tabbar/ 
需要将 images/tabbar/ 添加到 assets: 下才能访问得到图片

MaterialApp
theme ThemeData(
  primarySwatch: 主题色
  splashColor: Colors.transparent
  highlightColor: Colors.transparent，  // 去除水波纹
)

indexdStack
  index 

// 底部 bar
// 超过4个 type：BottomBarType.fixed
BottomNavigationBar(
  currentIndex: _currentIndex,
  selectedFontSize: 14,
  items:[
    NavigationBarItem()
  ]
)



 */