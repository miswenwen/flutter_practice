void main() {
  testMethod1();
}

void testMethod1() {
  var say = (str) {
    print(str);
  };
  say('hello');
  say3('hello', 333);
  var say2 = (str1, str2) {
    print(str1 + str2);
  };
  say2('hello', 'potter');
  var say4 = (String str, int a) {
    print(str + a.toString());
  };
  say4('hello', 444);
}

void say3(String str, int number) {
  print(str + number.toString());
}
