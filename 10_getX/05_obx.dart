类不需要 继承 StatefulWidget

方式一

RxInt count = RxInt(0);

  使用 Obx(()=> Text(count))
  修改 count++;


方式二

var count = Rx<double>(0);  // 使用 Rx 泛型的方式定义 
    使用方式同上

方式三

var count = 0.obs;
    使用方式同上


自定义类

class User {
  // rx 变量
  var name = 'lfm'.obs;
  var age = 18.obs;

  构造函数创建
  var name;
  var age;
  User({this.name, this.age})

}

build 方法中 

使用
  注意需要 .value 
  final user = User();

  Obx(()=> Text(user.name) );
  user.name.value = 'hhh';


构造函数创建时，使用方式需要进行修改
  final user = User(naem:'lfm',age:18).obs;

  Obx(()=> Text(user.value.name) );
  user.update((val){
    user.value.name = 'hhh';
  })
