
单独写 HomeRequest 类，
封装 config 文件，写不同模块的配接口地址

json -> Modal

在线网站 https://app.quicktype.io/
vscode 插件 `Paste JSON as Code`
  问题：在线网站会错误的转换成 double -> int 如 4.0 -> 4
       插件无法生成 formMap

ctrl+n 快捷键快速重写 toString
ListView -> MoiveItem

BoxDecration -> border: Border(botteom: BorderSide())
CLipRRect -> 裁切圆角 borderRadius:

Row 如果是多个 子widget 超出的话 不能换行 
  使用 Text.rich(TextSpan( children:[ widgetSpan( ), widgetSpan( ), TextSpan()])) 

xxx.join(' ');  // list 通过空格进行分割成字符串

Container 占满宽度 double.infinity
网页转换
flutterJsonBeanFactory 插件

豆瓣接口地址
可在移动 app 中分享当前页的链接，然后在 chrome 中查看请求接口

https://m.douban.com/rexxar/api/v2/subject_collection/ECWY6B2GQ/items?start=0&count=50&updated_at=&items_only=1&for_mobile=1

  header中需要加  
  Referer: https://m.douban.com/subject_collection/ECWY6B2GQ?dt_dapp=1


IntrinsicHeight 使用它包裹 Row 可以让 Row 的子元素和 Row 同高，会有一定的性能损耗
