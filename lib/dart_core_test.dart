//dart:core是默认导入的
void main(){
  //parse方法
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
  //radix是进制
  assert(int.parse('42', radix: 16) == 66);
}