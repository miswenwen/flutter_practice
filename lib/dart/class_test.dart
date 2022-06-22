//mixin,extends,with
void main() {
  Test test = Test();
  print(test.a);
  print(test.b);
  print(test.str);
}

class Test {
  int? a;
  double? b;
  String? str;
  String ss = 'sss\'ssss\'s\'';
}
