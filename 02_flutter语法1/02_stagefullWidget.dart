
/**
 * 
  column(); 子元素过多，超出安全区域，需要将其改成 List 让它可滚动
  侧轴会默认居中
  
  调整间距 SizeBox(height: 10)
  Image.network()
  Container() 
    margin
    padding: EdgeInsets.all(10),
    decoration: Boxdecoration(border: Border.all(width:5, color))

  ctrl+alt+b 查看所有实现类

  RaisedButton -> ElevatedButton 按钮
  Icon Icons.add

  计数器案例

  StatefulWidget 通过 widget.xxx 来获取传入的参数
  
 */

/**
 * 生命周期
 * constructor
 * initState 必须调用 super
 * 
 * setState 
 *  每次调用都会重新 build
 * 
 * didChangeDependencies
 * 
 * dispose  必须调用 super
 */