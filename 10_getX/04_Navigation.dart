// 前置跳转
GetMaterialApp(
  defaultTransition: 默认过渡动画
  getPages: [
    GetPage(name: '/home', page:()=> HomePage()),
    GetPage(name: '/about', page:()=> AboutPage()),
  ] 
)


路由跳转
匿名路由跳转 
Get.to(
  () => Home()
  transition: Transition.rightToLeft  从右向左
  duration: 
  curve: 动画效果
  arguments: 'xxx'
);

依旧可以等待路由返回的参数


// 返回
Get.back(result:'yyyy');

// 关闭所有页面，打开一个新页面
Get.offAllNamed("/NextScreen");

// 命令路由
Get.toNamed('/home');

// 传参

url后传参
GetPage(
    name: '/profile/:user',
    page: () => UserProfile(),
  ),
Get.toNamed("/profile/34954?flag=true");

接受
print(Get.parameters['user']);
print(Get.parameters['flag']);
// out: 34954 true


arguments 传参
Get.toNamed("/NextScreen", arguments: 'Get is the best');

接收
print(Get.arguments);
