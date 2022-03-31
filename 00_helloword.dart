//你好，世界，https://dart.cn/samples#hello-world
void main() {
  print('Hello,World!');
  varible();
}

//变量，https://dart.cn/samples#variables
void varible(){
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter','Saturn','Unranus','Neptune'];
  var image = {
    'tags':['saturn'],
    'url':'//path/saturn.jpg'
  };
  print('$name,$year,$antennaDiameter,$flybyObjects,$image');
}

//流程控制语句 https://dart.cn/samples#control-flow-statements
void control_flow_statements(){
  if(year>=2001){
    print('21st century');
  }else if(year>=1901) {
    print('20th century');
  }
  
}
