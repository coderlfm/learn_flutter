

Get.put<LoginController>(LoginController(), permanent: true); // 表示这个控制器常驻，例如保存用户 token
    // 可选：类似于 "永久"，
  // 不同的是，当不使用时，实例会被丢弃，但当再次需要使用时，Get会重新创建实例，
  // 就像 bindings api 中的 "SmartManagement.keepFactory "一样。
  // 默认值为false
  bool fenix = false
  一般用于在详情页停留时间太久，然后点击返回上一页时，控制器被回收的场景，如 视频播放完毕点击返回

// 初始化多个控制器，通过 tag 来区分
Get.put<ListItemController>(ListItemController, tag: "mysql");
Get.put<ListItemController>(ListItemController, tag: "mongodb");


如果是全局的依赖，可以在 app 中注入依赖，然后在需要使用的地方 听过 find找到依赖
Get.lazyPut(()=> Controller1())
Get.lazyPut(()=> Controller2())
Get.lazyPut(()=> Controller3())
