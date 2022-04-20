void main() {
  //age没有制定的时候是null，null也可以toString，打印'null'这个字符串
  testAlterMethod('potter');
  testAlterMethod('potter', 30);
}

/*方法*/

void testMethod() {}

//可选参数,注意要加?
//加个?就可以了，就是告诉编译器这是nullability类型，告诉编译器如果为空，我后面自己会处理的。
void testAlterMethod(String name, [int? age, String? home]) {
  print(name + age.toString());
}

/*是=>而不是->;
没有return关键字
 */
int testPlus() => 3 + 3;

int testPlus2() {
  return 3 + 3;
}
