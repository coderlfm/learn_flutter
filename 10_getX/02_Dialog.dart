Dialog 二次确认框

Get.defaultDialog(
  title:'',
  middleText: '中间'
)

content: 自定义区域
监听确认，取消事件
actions 扩展的按钮 Get.back();
barrierDismissble: false 点击背景不允许关闭

onWillPop 监听退出页面