import 'dart:convert';

import 'package:flutter_practice/open_source/json_serializable/user.dart';
import 'package:flutter_practice/open_source/json_serializable/usernew.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
void main() {
  testJson3();
}

///对于网络请求来说，返回的就是Json格式的一个字符串,我们先把它转换成Map类型，然后对应Model类去设计逻辑。
void testJson() {
  String jsonStr = '[{"name":"Jack"},{"name":"Rose"}]';
  List items = json.decode(jsonStr);
  print(items[0]["name"]);
}

void testJson2(){
  Map<String,dynamic> userMap = json.decode('{"name":"Jack","email":"Rose","age":"Rose"}');
  var user = User.fromJson(userMap);

  print('Howdy, ${user.name}!');
  print('We sent the verification link to ${user.email}.');
}
//android studio有个插件很好用。叫JsonToDart，非常方便。
//
// new JsonToDart
// 把Json字符串拷贝进来，勾选null-safety，生成对应dart文件
//
// 实际使用：
// 这里的String对象就是我们网络请求返回的字符串，是json格式，使用dart:covert的
// json.decode转换为Map，然后传进去就行了。非常好用
void testJson3(){
  Map<String,dynamic> userMap = json.decode('{"name":"Jack","email":"Rose","age":"Rose"}');
  Usernew usernew = Usernew.fromJson(userMap);
  print('Howdy, ${usernew.name}!');
}