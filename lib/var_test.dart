//Number,List,Set,Map

void main() {
  testVar();
  print("just try");
}

/*变量*/
void testVar() {
  //number
  var year = 1992;
  var max = double.infinity;//无限大，有时候布局里设置宽高的时候用
  //String
  var name = 'potter';
  var name1 = 'potter' * 10; //字符串重复n次，调试text的布局的时候好用

  //set
  var set = {'a', 'b', 'c'};
  var set2 = Set<String>();
  set2.add('a');
  set2.add('b');

  //list,注意变量名的格式 和java的是一致的
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  //下面这种写法编译不过
  // The default 'List' constructor isn't available when null safety is enabled. (Documentation)
  //可以参考https://dart.dev/null-safety/understanding-null-safety#no-unnamed-list-constructor,understanding null safety
  //var list2 = List<String>();
  var list2 = <String>[];
  list2.add('a1');

  //map
  var testMaps = {'name': 'potter', 'age': '30', 'home': 'yichang'};
  var map2 = Map<String, String>();
  //注意赋值方式，并不是add('name','potter');
  map2['name'] = 'potter';
  map2['age'] = '30';

  //Iterable
  var coffees = [];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  //isEmpty&isNotEmpty
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  //for each
  var teas2 = ['green', 'black', 'chamomile', 'earl grey'];
  teas2.forEach((tea) => print('I drink $tea')); //forEach里面是匿名内部类

  //where(),any(),every()
  var teas3 = ['green', 'black', 'chamomile', 'earl grey'];
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';
  // 使用 where() 来查找元素，这些元素在给定的函数中返回 true 。
  var decaffeinatedTeas = teas3.where((tea) => isDecaffeinated(tea));
  // 使用 any() 来检查集合中是否至少有一个元素满足条件。
  assert(teas3.any(isDecaffeinated));
  // 使用 every() 来检查集合中是否所有元素满足条件。
  assert(!teas3.every(isDecaffeinated));
}
