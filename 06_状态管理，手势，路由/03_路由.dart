
// 路由 
Route
MaterialPageRoute/CuprinoPageRoute 
安卓平台从底部滑动到顶部打开页面
ios平台从右边滑到到左边

Navigator

// 匿名路由
Navigator.of(context).push(MaterialPageRoute(builder:()=> Detail()));
Future result =  Navigator.push(context);
传参，直接 new Detail(param1:111, param2:222);

result.then((res){
  // 接受返回的参数
})

Navigator.of(context).pushNamed();

// 返回
Navigator.of(context).pop();
Navigator.of(context).pop('parma');

Appbar leading
  重新头部返回按钮来监听返回事件
套一层 WillPopScope
onWillPop(){} 监听返回事件
return Future.value(false); // false 表示自行返回，返回 true 表示交给 flutter 进行返回

// 路由映射表
routes:{
  '/about':()=> About
}

// 首页路由
initRoute:

路由名规范
static routeName=“/""

// 传参
Navigator.of(context).pushNamed(xxx.routeName,arguments:'xxx');
// 接受
final message = ModalRoute.of(context).settings.arguments as xxxxType

push arguments
参数

onGenerRoute 自定义匹配返回
switch (settings.name) {
  case xxxPage.routeName :
    return MaterialPageRoute(builder: yyy(settings.arguments))

  default:
}
onUnkRouter 404
 return MaterialPageRoute(builder: yyy) 