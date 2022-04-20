import 'dart:core';

void main() {
  testVar();
  print("just try");
}

/*变量*/
void testVar() {
  //number
  var year = 1992;
  //String
  var name = 'potter';

  //set
  var set = {'a', 'b', 'c'};

  //list,注意变量名的格式 和java的是一致的
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  //下面这种写法编译不过
  // The default 'List' constructor isn't available when null safety is enabled. (Documentation)
  //var list2 = List<String>();
  var list2 = <String>[];
  list2.add('a1');

  //map
  var testMaps = {'name': 'potter', 'age': '30', 'home': 'yichang'};
}


