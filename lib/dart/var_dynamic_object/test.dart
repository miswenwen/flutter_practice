/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
void main() {
  ///var:编译时确定类型，var 变量一旦赋值，类型便会确定，则不能再改变其类型
  ///dynamic：运行时确定类型，IDE不对该类型的方法和变量进行检查，可以随便写。但这也意味着你写错了也不知道
  ///Object只能用Object类的方法和变量，否则编译报错，应用场景少
  ///总结：大部分时候使用var和dynamic即可。
  var str1 = 'a';
  dynamic str2 = 'b';
  Object str3 = 'c';
  print(str1.length);
  //print(str1.zzz);//检查报错
  print(str2.lenght);
  print(str2.zzz); //不检查
  //print(str3.length);//检查都会报错
}
