在 initState 里使用 modalRoute

Timer.run((){}) 异步执行

theme: ThemeData()

MateiApp()
  title: '' // 配置 android 端中的 查看快照时的 名字，ios 不生效
   

ThemeData()
  
  // 亮度
  brightness: 

  // 导航，floatingButton，tabbar选中高亮的颜色，switch  CupertinoSwitch的背景色
  // 包含 primaryColor 和 accentColor，当然，如果设置了会覆盖
  primarySwatch: MaterialColor 类型
    MaterialColor 继承 Color 类。所以不能赋值 Color 类型
    会给主色分成 10个等级 50 - 900 重写了 [] 操作符
      并不是所有的颜色都是 MaterialColor ，例如 黑色就不是

  // 导航和 tabbar 颜色
  primaryColor: 

  // 设置 floatingBUtton switch 颜色
  accentColor

  buttonTheme:ButtonTheme(
    height:
    minWidth:
    buttonColor
  )
  /**
   FlatButton、RaisedButton 和 OutlineButton 已分别替换为 TextButton、ElevatedButton 和 OutlinedButton。ButtonTheme 已被 TextButtonTheme、ElevatedButtonTheme 和 OutlinedButtonTheme 取代。原始类已被弃用，请迁移使用它们的代码。flutter.cn/go/material-button-migration-guide 中有关于新按钮和按钮主题类的详细迁移指南 。
   */

  cardTheme:

  // 配置脚手架背景色
  canvasColor: 

  // 文字主题
  textTheme: TextTheme(

    // 默认文本大小 14
    body1:

    // 默认文本大小的粗体 14
    body2:
    
    display1:
    display2:
    display3:
    display4:

  )

  局部主题
  在其它页面的根 widget 外包裹 Theme 进行覆盖
  Theme.of(context).copyWith() 只进行一些必要的覆盖
  但是覆盖不了 Floatin 的颜色
  需要单独处理
  Theme
    data:Theme.of(context).copyWith(
      colorScheme:Theme.of(context).colorScheme.copyWith(
        secondary: Colors.pink
      )
    )

  暗黑主题


将主题配置抽离到 class 中的 static 属性中

class AppTheme {
  static const double samllFontSize = 16;
  static const double normalFontSize = 16;
  static const double largeFontSize = 16;

  static final ThemeData norTheme = ThemeData();
  static final ThemeData darkTheme = ThemeData();
}


  Theme.of(context).textTheme.body2

为什么 switch 背景会有浅的主色

