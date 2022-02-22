1. import 'dart:html';
import 'dart:web_gl';

修改项目 id 
android/app/build.gradle 
  defaultConfig applicationID "com.lf.ss"

2. 修改项目名称
android/app/src/main/AndroidMainifest.xml
  label="项目名称"

3. 修改项目图标
android/app/src/main/res/
  有对应的像素比图标

  /drawable 项目启动图
  bitmap 会自动根据分辨率去寻找对应的启动图， 可以放到高分辨率上

  ios 端 打开 xcode 然后再打开到项目下的 ios 文件夹
  Runner
    Bundle identifier  修改id
  info.plist
    Bundle name 修改名称
  
  Runner/Aeests.xcassets /AppIcon app图标

  配置封面图 
  Runner/Aeests.xcassets /launchImage app启动封面图 需要配置 2x 3x

  LaunchScreen.storboard
    View Controller Scono
      View Controller/View  右上角新增 Image View 控件

      将 Image View 控件拖满屏幕 或者 选中 它后 右下角添加 四边都为 0 的约束，这里会自动将其放置在安全区域内
      选中控件后 右边操作栏 点击 image 然后选择封面图，填充选择为 aspect Fill

目录结构
core
  model
  router
  services
  store
ui
  pages
  shard
  widgets

main.dart 
app.dart

加载 json
  final jsonStirng = await rootBundle.loadString('assets/json/xxx.json')
  final jsonMap = json.decode(jsonString) dart:convert 库

将 '35f325' 转换成 Color
final colorInt = int.parse('35f325',radix: 16);
cColor = Color(colorInt | 0xFF000000);

颜色渐变
Container
  decoration
    gradient: LinearGradient( 线性渐变
      colors:[
        Colors.red.withOpacity(0.5),
        Colors.red
      ]
    )

// 类似于懒加载， 但是它是每次构建都会发送一次网络请求，请求成功后再构建需要的展示的内容
// 只有需要每次重新构建时才比较适合使用3
FutureBilder<List<XXXModel>>(
  future: XXXX.getData(),
  builder: (ctx, snapshot){
    if(!snapshot.hashData) return CircularProgressIndicator(); // 圆形进度条
    if(!snapshot.error) return Text('失败'); // 失败

    return Text('${snapshot.data}');
  }
)

在 全局State 中异步获取到数据后可以手动调用 notierLinter();
全局的 State 在初始化的时候不会加载，会在第一次使用到这个数据的时候再进行加载

where 类似 filter
fontains 类似 includes
ListEquality().equals(list1,list2);// 比较两个list 里面的元素是否相等
圆角
ahape RoundeRectangleBorder(borderRadius: BorderRadius.circular(12.px));


// 包裹后就可以滚动
SingleChildScrollView -> Column 

ListView 默认会尽可能的占满高度
如果里面再套了 ListView 则会出现 hasSize 的错误，可以在 ListView 外套一层 Container 然后固定高度，可以出现局部滚动

shrinkWrap: true, // 表示由子元素撑开
phpsics: NeverScrollableScrollPhysisics() 拖动时可以和主屏幕一起拖动，默认是局部滚动
百分比 MediaQuery.of(context).size.width * 0.8
 MediaQuery.of(context).size.width - 30.px

 Column 的宽度默认是子元素的最大宽度，所以需要占满宽度的时候需要套一个 Container 然后无限宽，避免布局闪烁的问题


 drawer: Drawer();侧边抽屉

需要鼠疫 这个context 必须在Scaffold 的里面，一般可以通过套用 Builder 来实现
Scaffold.of(context).openDrawer();