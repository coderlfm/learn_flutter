ui 和 controller 分离

使用


  // 方式一 依赖注入
  HomeController homeController = Get.put(HomeController());

  Obx(()=> Text(homeController.user.name));

  修改
    homeController.change();


  // 方式二
  GetX<HomeController>(
    init: HomeController(),
    builder:(controller){
      return Text(homeController.user.user)
    }
  )

  修改
    Get.find<HomeController>().change()


  // 方式三
  GetBuilder<HomeController>(
    init: HomeController,
    builder: (controller){
      return Text(controller.user.user)
    }
  )


如果通过构造函数的方式定义， XXX().obs 则表示将整个对象变成了响应式 使用的时候需要 xxx.value.a xxx.value.b 

更新时
xxx.update((xxx){
  xxx.a = aa;
  xxx.b = bb;
})

继承自 GetxController 的类有一个 onInit方法，
第一个 调用 put 的时候就会调用 onInit

后续可以调用 find 找到这个已经初始化的控制器

