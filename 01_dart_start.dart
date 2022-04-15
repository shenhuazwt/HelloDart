import 'dart:async';
import 'dart:io';
import 'dart:math';
//导入（Import），https://dart.cn/samples#imports
// Importing core libraries
//import 'dart:math';
// Importing libraries from external packages
//import 'package:test/test.dart';
// Importing files
//import 'path/to/my_other_file.dart';

//变量均适合使用var，https://dart.cn/samples#variables
void varible() {
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Unranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/saturn.jpg'
  };
  print('$name,$year,$antennaDiameter,$flybyObjects,$image');
  control_flow_statements(year, flybyObjects);
}

//流程控制语句,https://dart.cn/samples#control-flow-statements
void control_flow_statements(var year, var flybyObjects) {
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }
  //打印数组内容，从数组第一个内容开始遍历
  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
}

//函数，https://dart.cn/samples#functions
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2); //递归
}
//var result = fibonacci(20);在main函数里面调用

//=> (胖箭头) 简写语法用于仅包含一条语句的函数。该语法在将匿名函数作为参数传递时非常有用
///下面的where内容是做筛选内容出来，再进行打印
//flybyObjects.where((name)=>name.contains('turn')).forEach(print);

//注释https://dart.cn/samples#comments
//常用//作为注释的开始
///这是一个文档注释
///文档注释用于库、类以及成员添加注释
///像IDE和dartdoc这样的工具可以专门处理文档注释

/*也可以像这样使用单斜杠和星号的注释方式*/

//类（class），https://dart.cn/samples#classes
//类是归纳出来，先有对象，后有类
class Spacecraft {
  String name;
  DateTime? launchDate; //‘？’用来让空不报错，不一定有，所以要防止报错

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
    //TODO ,这个表示还没处理，用来提醒还没有写完的意思
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/
          365; //  ~/表示整除，difference表示时间差，day表示是获得天数
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

//扩展类（继承），https://dart.cn/samples#inheritance
//开发是先写子类，再抽取共同点集成父类，所以说是扩展而不是继承
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);

  //方法重写叫重载
}

//Mixins,https://dart.cn/samples#mixins
//注入，可以让类添加功能
mixin Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts:$astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

void Mixins() {
  print('\n');
  print('*' * 40);
  print('Mixins');
  print('*' * 40);

  var test = PilotedCraft('天宫一号', DateTime(2004, 12, 13));

  test.describe();
  test.describeCrew();
}

//接口和抽象类 https://dart.cn/samples#interfaces-and-abstract-classes
class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  String name;

  MockSpaceship(this.name, this.launchDate);

  @override
  void describe() {
    print('Mock Spacecraft:$name');
  }

  @override
  int? get launchYear => launchDate?.year;
}

void interface_and_abstract_classes() {
  print('\n');
  print('*' * 40);
  print('接口和抽象类');
  print('*' * 40);

  var mock = MockSpaceship('飞行器', DateTime(1997, 11, 11));

  mock.describe();
}

//异步 https://dart.cn/samples#async
Future<void> the_async() async {
  print('\n');
  print('*' * 40);
  print('异步');
  print('*' * 40);

  const oneSecond = Duration(seconds: 1);

  Future<void> printWithDelay1(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  printWithDelay1('过了1秒钟. 1');
  print('done 1.');

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  printWithDelay2('过了1秒钟. 2');
  print('done 2.');

  Future<void> createDescriptions(Iterable<String> objects) async {
    for (final object in objects) {
      try {
        var file = File('$object.txt');
        if (await file.exists()) {
          var modified = await file.lastModified();
          print(
              'File for $object already exists. It was modified on $modified.');
          continue;
        }
        await file.create();
        await file.writeAsString('Start Describing $object in this file.');
        print('File for $object created.');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }

  var the_objects = ['高铁', '动车', '火车'];
  createDescriptions(the_objects);

  printWithDelay1('5秒后进入下一步');
  await Future.delayed(Duration(seconds: 5)); //5秒后结束
}

// Stream https://www.jianshu.com/p/f9af079782af
Future<void> the_stream() async {
  print('\n');
  print('*' * 40);
  print('Stream');
  print('*' * 40);

  const oneSecond = Duration(seconds: 1);

  StreamController<double> ctl = StreamController<double>();
  Stream stm = ctl.stream;

  stm.listen((event) {
    print('event from controller is: $event');
  });

  Future<void> addWithDelay(value) async {
    await Future.delayed(oneSecond);
    ctl.add(value);
  }

  addWithDelay(10.0);
  addWithDelay(20.0);
  addWithDelay(30.0);

  await Future.delayed(oneSecond);
  print('5秒后进入下一步');
  await Future.delayed(Duration(seconds: 5));
}

// 异常 https://dart.cn/samples#exceptions
Future<void> show_descriptions(flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (ex) {
    print('Could not describe object: $ex');
  } finally {
    flybyObjects.clear();
  }
}

void exception() {
  print('\n');
  print('*' * 40);
  print('异常');
  print('*' * 40);

  var object = {'高铁', '动车', '火车','吴杰'};
  
  show_descriptions(object);
}

//你好，世界，https://dart.cn/samples#hello-world
Future<void> main(List<String> args) async{
  print('Hello,World!');
  varible();
  var result = fibonacci(20);
  print('fibonacci(20)=$result');

  print('类的使用！');
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  //Mixins
  Mixins();

  //接口和抽象类
  interface_and_abstract_classes();

  //异步
  await the_async();

  //stream
  await the_stream();

  //异常
  exception();
}
