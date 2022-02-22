main(List<String> args) {
  print('111');
  final p1 = Person();
  print(p1.name);
}

class Person extends A,B {
  // String name = '222';
  // set setName(String s1) => this.name = s1;
  // get getName => this.name;

  String _name = '222';
  set name(String s1) => this._name = s1;
  String get name => this._name;
}
