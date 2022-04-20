//dart:core是默认导入的
void main(){
  //print方法
  print('my name is potter');
  //parse方法
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
  assert(double.parse('1.2e+2') == 120.0);
  assert(double.parse('1.2e-2') == 0.012);
  //radix是进制
  assert(int.parse('42', radix: 16) == 66);
}