import 'package:get/get.dart';

//注意要继承Get的Translations这个类，而且要重写keys,Translations实际源码也就这个get keys，相当于强制要求你重写
//注意要把Messages在GetMaterialApp里面引用，对应的形参是translations
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_us': {
          'hello': 'hello1',
          'name': 'potter1',
        },
        'zh_CN': {
          'hello': '你好',
          'name': '刘启鹏',
        }
      };
}
