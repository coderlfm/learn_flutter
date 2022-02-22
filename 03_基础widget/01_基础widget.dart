/* 文本省略号
overflow：TextOverflow.ellipsis
maxLines: 3 */

富文本
Text.rich -> TextSpan() -> TextSpan()/WidgetSpan() 

Row Column

// 设置 Row 和 Column 为由内容撑开
mainAxisSize: MainAxisSize.min

// 按钮圆角
style: ButtonStyle(
  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10px))),
)

// 图片
// 填充
fix: BoxFit.cover/xxx fitWidth 高度根据宽度自适应

aligment: Alignment.bottomCenter  
          Alignment(x,y) 范围 -1 1， 如果写负值会跑出去
          color
          colorBlendMode: BlendMode.colorDoage // 颜色混入
          repeat: ImageRepeat.repeatY

本地图片
1. 创建文件夹

assets:
  - lib/assets/images/

执行 pub get


占位图
淡入淡出时间
图片缓存 1000张||100m

处理按钮边距
按钮宽高，需要使用 Container

width: double.infinity 尽可能占满


字体
\uXXXX fontFa


输入框 
textFidld
InputDecoration
labelText："username"
hintText

按钮提交
final xxx =TextEditingController();

TextField(
  controller: xxx
)

onPress(){
  print(xxx.text)
}