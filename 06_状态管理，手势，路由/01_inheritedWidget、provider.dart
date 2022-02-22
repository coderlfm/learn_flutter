
继承 InheritedWidget 

1. 重写 updateShouldNotify
  true 执行子组件的 didChangeDependencies()
  false 不执行
   return oidWidget.counter  != counter

2. 构造函数接受 child
3. 编写 返回自身的 of 静态方法
  context.dependOnInheritedWidgetOfExactType()
4. 编写 共享属性 可接受为构造函数参数作为默认值

这样每次更新外部传入的值，子组件就能接收到了

子组件 build 方法中使用  int yyy = XXXXX.of(context).yyy



Provider

在程序顶层
在 runApp 中传入 ChangeNotifierProvide()  
  create: ()=> 共享的数据/store
  child: MyApp()

  // 多个状态需要共享 
  传入 MultiProvider(
    prividers:[
      ChangeNotifierProvide(create:()=> HomeStore() ),
      ChangeNotifierProvide(create:()=> HomeStore() ),
      ChangeNotifierProvide(create:()=> HomeStore() ),
    ],
    child: MyApp()
  )

ViewModel/store

共享的数据
HomeStore extends ChangeNotifier
ctrl+n 生成 get set
在 set 中调用 notifyListerner()


获取数据
  1. 在 build 方法中  (数据更新会重新执行 build 方法)
    final homeCounter = Provier.of<HomeStore>(context).counter

  2. 在需要使用的 widget 中 (推荐)
    该方法还可以直接修改状态
    Consumer<HomeStore> ()
      builder: (ctx, counterStore, child)
      return  child; // 数据更新时不重新构建 child

      child: Button(onPressed:(){ counterStore.counter +=1 });

    // 可以做一个转换，第一个是原始值，第二个是转换后的值，
    //在 selector 中会将 原始值传入，然后需要返回转换后的值
    // shouldRebuild 会传入 prev 和 next 转换后的值
    Selector<HomeStore,HomeStore>()
    selector: (ctx, counterStore) => counterStore; 
    shouldRebuild: (prev,next) => false; // 表示包裹的子元素不需要重新构建，不依赖数据源


如果项目中有多个 数据需要共享
  1. 嵌套
  2. MultiProvider

如果一个组件需要依赖多个数据
Consumer2/Consumer3

Consumer2<aaa,bbb>

builder:(ctx,aaaSotre,bbbStore,child){}


FittedBox 挤压 压缩过大的widget

context.watch<T>()，widget 能够监听到 T 类型的 provider 发生的改变。
context.read<T>()，直接返回 T，不会监听改变。
context.select<T，R>(R cb(T value))，允许 widget 只监听 T 上的一部分内容的改变。

你也可以使用 Provider.of<T>(context) 这一静态方法，它的表现类似 watch， 而在你为传入 listen: false 参数时（例如 Provider.of<T>(context，listen: false)）， 它的表现与 read 类似。

值得注意的是，context.read<T>() 方法不会在值变化时让 widget 重新构建， 并且不能在 StatelessWidget.build 和 State.build 内调用. 换句话说，它可以在除了这两个方法以外的任意位置调用。