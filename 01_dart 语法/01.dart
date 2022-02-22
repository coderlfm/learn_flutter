main(List<String> args) {
  List<String> names = ['a', 'b', 'c'];

  test(() {
    print("匿名函数被调用");
  });

  void fn(String name, {int? age, double? height}) {
    print(name);
  }

  test(() => print("匿名箭头函数被调用"));

  //  typedef 限制函数作为参数时的 参数类型
  test2((num1, num2) => num1 + num2);

  test3((num1, num2) => num1 + num2);

  /// 运算符
  /**
   * ??= 
   * ?? 
   * .. 级联运算符
   * 循环的使用 for for..in
   */

  // 当 name 是空时才赋值为 小明
  var name = null;
  name ??= '小明';

  // 前一个变量为 null 时则使用后面的值
  var name2 = name ?? '小红';

  const String s1 = '111';

  // 级联调用
  final p1 = Person()
    ..name = '小彤'
    ..sayHello()
    ..sayName();

  // for 和for in 都可以遍历 list，for in 还可以遍历 Map
}

void test(Function fn) {
  fn();
}

void test2(int sum(int num1, int num2)) {
  sum(10, 20);
}

typedef sumType = int Function(int num1, int num2);
void test3(sumType sum) {
  sum(10, 20);
}

class Person {
  String name = '';

  void sayName() => print(this.name);
  void sayHello() => print('hello');
}
