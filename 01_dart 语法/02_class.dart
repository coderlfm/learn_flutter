main(List<String> args) {
  const p = Person.withConst('lfm', 18, 1.88);
  const p1 = Person.withConst('lfm', 18, 1.88);
  print(identical(p, p1));

  final p2 = Person2.withName('lfm');
  final p3 = Person2.withName('lfm');
  print(identical(p2, p3));
}

class Person {
  final String name;
  final int age;
  final double height;

  // 简写构造函数, flutter 2 之后 空安全不支持 类属性存在 null
  // Person(this.name, this.age, this.height);

  // 命名构造函数
  // Person.withHeigth(this.name, this.age, this.height);

  // 报错了，应该是空安全的问题
  // Person.withMap(Map<String, dynamic> map) {
  //   this.name = map['name'];
  //   this.age = map['age'];
  //   this.height = map['height'];
  // }

  // 常量构造函数，需要将所有的成员变量加上 final
  const Person.withConst(this.name, this.age, this.height);

  // 初始化列表的使用
  Person.withHeigth(this.name, {int age = 18, double height = 1.88})
      : this.age = age,
        this.height = height;

  // 构造函数的重定向
  Person(String name, int age, double height) : this._internal(name, age, height);

  Person._internal(this.name, this.age, this.height);

  // 工厂构造函数，传入相同的名字，返回相同的color，factory 需要手动返回对象
  // containsKey('xxx'); 判断 Map 中是否存在某个key
  // final p2 = Person2.withName('lfm');
  // final p3 = Person2.withName('lfm');

}

// 传入 相同的 name 或 school 会获取出同一个对象
class Person2 {
  final String name;
  final String school;

  // 姓名和学校的缓存
  static Map<String, Person2> _nameCache = {};
  static Map<String, Person2> _schoolCache = {};

  factory Person2.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name]!;
    } else {
      Person2 p = Person2(name, 'default');
      _nameCache[name] = p;
      return p;
    }
  }

  factory Person2.withSchool(String school) {
    if (_schoolCache.containsKey(school)) {
      return _schoolCache[school]!;
    } else {
      Person2 p = Person2('default', 'school');
      _schoolCache[school] = p;
      return p;
    }
  }

  Person2(this.name, this.school);
}
