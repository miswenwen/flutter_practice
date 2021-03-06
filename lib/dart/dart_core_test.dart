//dart:core是默认导入的
void main() {
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

  //字符串相关方法
  // 检查一个字符串是否包含另一个字符串。
  assert('Never odd or even'.contains('odd'));
  // 一个字符串是否以另一个字符串为开头?
  assert('Never odd or even'.startsWith('Never'));
  // 一个字符串是否以另一个字符串为结尾?
  assert('Never odd or even'.endsWith('even'));
  // 查找一个字符串在另一个字符串中的位置。
  assert('Never odd or even'.indexOf('odd') == 6);

  //关键字in的一种应用场景
  for (var char in 'hello'.split('')) {
    print(char);
  }

  // Trim a string. trim() 移除首尾空格
  assert('  hello  '.trim() == 'hello');

  //正则表达式regular expression，记好是RegExp即可，后续用的时候再细看
  var numbers = RegExp(r'\d+');
}
