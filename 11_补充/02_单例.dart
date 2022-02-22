class Person {
  Person._(); // 编写命名构造函数，防止通过默认构造函数来实例化

  static Person? _instance;

  static getInstance() {
    if (_instance == null) _instance = Person._();
    return _instance;
  }
}

final p1 = Person(); // 不能通过默认的构造函数实例化，防止误操作

final p2 = Person.getInstance(); //获取单例
