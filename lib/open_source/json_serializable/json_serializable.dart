import 'dart:convert';

import 'package:flutter_practice/open_source/json_serializable/user.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
void main() {
  testJson();
}

void testJson() {
  String jsonStr = '[{"name":"Jack"},{"name":"Rose"}]';
  List items = jsonDecode(jsonStr);
  print(items[0]["name"]);
}

void testJson2(){
  Map<String,dynamic> userMap = json.decode('[{"name":"Jack"},{"email":"Rose"}],{"age":"Rose"}]');
  var user = User.fromJson(userMap);

  print('Howdy, ${user.name}!');
  print('We sent the verification link to ${user.email}.');


}
