import 'dart:math';

//数字、集合、字符串等 https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more
void dart_num_numbers_collections_string_and_more() {
  //控制台打印 https://dart.cn/guides/libraries/library-tour#printing-to-the-console
  print('\n');
  print('*' * 40);
  print('数字、集合、字符串等');
  print('*' * 40);

  //数字https://dart.cn/guides/libraries/library-tour#numbers

  //assert是在调试时才显示出来的
  //使用 int 和 double 的 parse() 方法将字符串转换为整型或双浮点型对象：
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  //或者使用 num 的 parse() 方法，该方法可能会创建一个整型，否则为浮点型对象：
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);

  //通过添加 radix 参数，指定整数的进制基数
  assert(int.parse('42', radix: 16) == 66);

  //使用 toString() 方法将整型或双精度浮点类型转换为字符串类型。使用 toStringAsFixed(). 指定小数点右边的位数，使用 toStringAsPrecision(): 指定字符串中的有效数字的位数。
  assert(42.toString() == '42');
  assert(123.456.toString() == '123.456');
  assert(123.456.toStringAsFixed(2) == '123.46');
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  //字符和正则表达式 https://dart.cn/guides/libraries/library-tour#strings-and-regular-expressions

  //在 Dart 中一个字符串是一个固定不变的 UTF-16 编码单元序列。语言概览中有更多关于 strings 的内容。使用正则表达式 (RegExp 对象) 可以在字符串内搜索和替换部分字符串。

  //可以在字符串内查找特定字符串的位置，以及检查字符串是否以特定字符串作为开头或结尾。
  assert('Never odd or even'.contains('odd'));
  // Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));
  // Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));
  // Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);

  //从字符串中提取数据
  assert('Never odd or even'.substring(6, 9) == 'odd');

  // Split a string using a string pattern.
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  // Get a UTF-16 code unit (as a string) by index.
  assert('Never odd or even'[0] == 'N');

  // Use split() with an empty string parameter to get
  // a list of all characters (as Strings); good for
  // iterating.
  for (final char in 'hello'.split('')) {
    print(char);
  }

  // Get all the UTF-16 code units in the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

//思考题list中将字符添加在前面时怎么做！！！！

  //首字母大小写转换
  //可以轻松的对字符串的首字母大小写进行转换：

  // Convert to uppercase.
  assert('web apps'.toUpperCase() == 'WEB APPS');
  var str = 'afbgs'; //test
  assert(str[0].toUpperCase() == 'A');

  // Convert to lowercase.
  assert('WEB APPS'.toLowerCase() == 'web apps');

  //Trimming 和空字符串
  //使用 trim() 移除首尾空格。使用 isEmpty 检查一个字符串是否为空（长度为 0）
  // Trim a string.
  assert(' hello '.trim() == 'hello');
  // Check whether a string is empty.
  assert(''.isEmpty);
  // Strings with only white space are not empty.
  assert('  '.isNotEmpty);

  //替换部分字符串
  //字符串是不可变的对象，也就是说字符串可以创建但是不能被修改。
  var greetingTemlate = 'Hello, NAME';
  var greeting = greetingTemlate.replaceAll(RegExp('NAME'), 'Bob');

  // greetingTemplate didn't change.
  assert(greeting != greetingTemlate);
  print('greeting:$greeting\ngreetingTemlate:$greetingTemlate');

  //构建一个字符串
  //要以代码方式生成字符串，可以使用 StringBuffer 。
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    //writeAll() 的第二个参数为可选参数，用来指定分隔符
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();

  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  //正则表达式
  //RegExp 类提供与 JavaScript 正则表达式相同的功能
  // Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigitals = 'llamas live 15 to 20 years';

  // contains() can use a regular expression.
  assert(!allCharacters.contains(numbers));
  assert(someDigitals.contains(numbers));

  // Replace every match with another string.
  var exedOut = someDigitals.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');

  var someDigits = 'llamas live 15 to 20 years';

  // Check whether the reg exp has a match in a string.
  assert(numbers.hasMatch(someDigits));

  // Loop through all matches.
  for (final match in numbers.allMatches(someDigits)) {
    print(match.group(0)); // 15, then 20
  }

  print('dart_num_numbers_collections_string_and_more is OK');
}



void main(List<String> args) {
  //数字、集合、字符串等
  dart_num_numbers_collections_string_and_more();
}
