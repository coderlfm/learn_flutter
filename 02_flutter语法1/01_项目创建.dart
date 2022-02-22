/**
 * flutter craete xxx_yyy
 * 不支持驼峰，使用下划线分割
 * android studio 打开创建的项目
 * 安装 flutter 和 dart 插件 plugins
 * 
 * .dart_tool 记录第三方插件的一些信息
 * .idea 当前项目配置
 * xxxx.iml 功能同上
 * android 工程
 * ios 工程
 * lib 源代码
 *  main.dart -> main()
 * test 测试
 * .metadata 对flutter 版本进行记录的
 * 
 * 热重载
 *  主要执行 build 方法
 *  
 * 热重启
 * 重新执行整个 app
 */

/**
 * main 中需要调用 runApp 函数，传入 widget ，万物皆是 widget
 * 如 Text 就是 Widget 的子类，需要传入 指定方向，使用 material 风格默认会设置成从左往右
 * 
 * Text 加字体样式，颜色
 * 让 Text 在屏幕居中
 * 
 * 将 MaterialApp 作为 runApp 的参数传进去, cupertino 风格是类似ios的风格
 * 再将需要展示的内容作为 home 传入
 * debugShow... : false,
 * 
 * home中套入 Scaffold() -> 脚手架
 * appBar: AppBar(title:'')
 * body: Widget()
 */

/**
 * StatefulWidget 有状态
 * StatelessWidget 无状态
 * 
 * Row MainAxisAlignment 设置主轴居中
 * 
 * StatelessWidget 是immutable，属性必须是 final 定义的
 * 
 * android/ios 命令式编程
 * vue/react 声明式编程 只处理状态
 * 
 * flutter 中，所有的 widget 都不能写状态
 */

class Body extends StatefulWidget {
  @voerride
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {
  var flag = true;

  Widget build(BuildContext context) {
    onChanged:(value){
      setState((){
        // this.flag = value;
        flag = value;
      })
    }
  }
}

// main() {
//   runApp();
// }


