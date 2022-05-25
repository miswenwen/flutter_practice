import 'package:dio/dio.dart';
/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

void main() {
  //runApp(MyApp());
  //getHttp();
  //默认下载在项目根目录下面
  //https://gdown.baidu.com/appcenter/pkg/upload/6492a4814e1b7dca6dc618a0b6f82c18
  Future<Response> response = Dio().download('https://gdown.baidu.com/appcenter/pkg/upload/6492a4814e1b7dca6dc618a0b6f82c18', './京东.apk');
}

void getHttp() async {
  try {
    var response = await Dio().get('http://www.google.cn');
    //print(response);
    print('potter: ${response.headers}');
  } catch (e) {
    print(e);
  }
}

