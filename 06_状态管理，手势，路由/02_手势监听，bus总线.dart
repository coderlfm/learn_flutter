手势
Listener 监听
  可以监听简单的事件 按下、移动，然后释放或取消
  onPointerUp 监听点击  event 可以获取到距离屏幕边缘的位置

如果要监听更高级的事件可以用 MouseRegion 或 GestureDetector
事件会冒泡  (没有机制取消或停止“冒泡”过程)
  一般用来监听滑动，下拉刷新，上拉加载等事件家监听

    onPointerDown
    onPointerMove
    onPointerUp
    onPointerHover
    onPointerCancel
    onPointerSignal


GestureDetector 
  默认不会冒泡
  onLongPress 长按事件 

  Container 嵌套时，子的 Container 会被默认设置为父的大小，需要中间套一层，如 给父 widget 加一个 alignment.center  使其套一个 Align

时间偶尔冒泡的解决方案
套 Stack
IgnorePointer 阻止冒泡

事件总线
event_bus

// 创建全局bus
event = EventBus();

// 创建 事件model
class ChangeMesEvent {
  String msg;
  ChangeMesEvent(this.msg);
}

// 发出事件
event.fire(ChangeMesEvent('11111'))

// 监听事件 传入泛型
initState() {
   event.on<ChangeMesEvent>().listen((data) {});
}

