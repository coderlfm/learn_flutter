import 'dart:html';

WidgetSpan
  alignment: Alignment.middle  富文本居中对齐

  如果需要做换行，则需要 遍历每一个文字的编码，然后将其渲染成一个个WidgetSpan
  ...title.runes.map((rune) {
    return WidgetSpan(child: Text(new String.formCharCode(rune)))
  }).toList(),

tabbar 图标闪烁
1. 测试真机是否有闪烁
2. 测试 Icon 是否有闪烁
3. 查看是否有对应的属性配置
    给每个 item 的 icon 都添加 gaplessPlayback: true;

手动封装 查看打印的所在行 

每一个 _state 有对 _widget对引用
  _widget 也有对 _state 的引用


Key
  ValuKey();
  UniqueKey(); 自动生成唯一key

  LocalKey
    ValueKey()
    ObjectKey()
    UniqueKey()

  GlobalKey() 类似于前端中的 ref,用来获取 widget 中的内容，调取子组件的属性或者方法
GlobalObjectKey
  final GlobalKey<_HomeContentState> homeKey = GlobalKey();
  
  homeKey.curretnState.message
  homeKey.curretnState.widget.message
  homeKey.curretnState.submit();
  homeKey.curretnState.setState();