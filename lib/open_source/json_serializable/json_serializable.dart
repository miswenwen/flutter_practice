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

///对于网络请求来说，返回的就是Json格式的一个字符串
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
void testJson3(){
  Map<String,dynamic> userMap = json.decode('{"name":"Jack","email":"Rose","age":"Rose"}');
  Usernew usernew = Usernew.fromJson(userMap);
  print('Howdy, ${usernew.name}!');
}