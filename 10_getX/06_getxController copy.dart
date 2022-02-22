ui 和 controller 分离
  // 1. 继承 GetController 
  
  // 依赖注入 会自动释放
  HomeController homeController = Get.put(HomeController());

  onInit/onClose
  onInit 初始化可以在查立

  // 性能更好，不会自动监听
  class CounterState extends GetxController {
    int count =0;

    void increment(){
      count++;
      update();
    }
  }
  // 性能更好一些
  GetBuilder<CounterState>(
    init: CounterState(), // 可以不传，在使用到的时候会自动
    builder:(_) => Text(_.counter);
  )

  // 只会在使用到的地方更新
  GetX<MyController>(
    init: MyController(),
    builder: (_) => Text(_.var),
  )

  需要先进行注入，整个weidget 会更新
  Obx()

  可以在app 更早的地方先进行注入
  
  然后添加静态方法 to
  static Controller get to => Get.find();


GetBuilder
如果有 使用到了状态却又 不需要更新，可以给一个 固定 id：'12'，

如果需要指定更新某个 则在 调用 update的同时传入一个数组，将需要更新的id传入，其它没有id或者没传入id 的不会更新