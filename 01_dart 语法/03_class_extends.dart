enum SystemColors { red, blue, green }

main(List<String> args) {
  // 没有 public private protected

  // set get 可以写箭头函数，get不能加小括号
  final p = Person();
  p.setName = '小明';
  print('name: ${p.getName}');

  // 继承，在初始化列表中调用父类的构造函数，只支持单继承
  final b = BWM('x5');
  print('${b.barnd} ${b.model}');

  // 抽象类
  // 子类必须实现，且抽象类不能实例化，如果需要实例化，则需要通过工厂构造函数来实例化该类的子类
  // extenal factory Map(); 方法的声明和实现进行分离，针对不同平台做不同的实现
  /**
   * @patch 第03语法讲解中
   */

  final w = Woman();

  // 隐式接口，dart 中所有的类都是隐式接口， implements 可以实现多继承，且实现的类必须实现抽象类的所有方法
  // extends XXX implements YYY, ZZZ

  final c = C();

  // mixin
  // 使用 with 实现多 混入

  // 类属性和类方法
  print(Book.color);
  Book.foo();

  // 枚举 enum，所有的枚举类型都有 values，和 index
  final color = SystemColors.blue;
  print(SystemColors.values);
  print(color.index);
}

class Person {
  String name = '';

  set setName(String name) => this.name = name;

  get getName => this.name;

  // String get getName {
  //   return this.name;
  // }

}

// 继承
class Car {
  final String barnd;

  Car(this.barnd);
}

class BWM extends Car {
  final String model;

  BWM(this.model) : super('宝马');
}

// 抽象类
abstract class Animal {
  void eat();
  void sleep();
}

// 实现类必须重写
class Woman extends Animal {
  @override
  void eat() {
    // TODO: implement eat
  }

  @override
  void sleep() {
    // TODO: implement sleep
  }
}

// implements 实现
class A {
  void a() {}
}

class B {
  void b() {}
}

class C implements A, B {
  void a() {}

  void b() {}
}

// mixin 混入，拥有 A 和 B
class CC with A, B {}

// static
class Book {
  static String color = 'red';
  static foo() {
    print('Book foo');
  }
}
