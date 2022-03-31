//你好，世界，https://dart.cn/samples#hello-world
void main() {
  print('Hello,World!');
  varible();
  var result = fibonacci(20);
  print('fibonacci(20)=$result');
}

//变量，https://dart.cn/samples#variables
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
  return fibonacci(n - 1) + fibonacci(n - 2);
}
//var result = fibonacci(20);在main函数里面调用
