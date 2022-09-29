import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

///几个要点：
///1.main()方法里的runApp要传GetMaterialApp(用这个主要是为了路由导航的功能，GetMaterialApp是基于MaterialApp的扩展)
///2.用了Get后，StatefulWidget可以退居幕后了
///3.GetxController有点类似一个全局单例，它会和根Widget，也就是Scaffold关联在一起。子Widget里面随便拿Controller的数据
///4.Controller里的数据变了，对应引用该数据的widget会刷新(前提是数据我们obs，相当于观察了)

///优点：
///路由跳转容易了，不需要像fluro那样去专门注册
///obs很好用，数据绑定刷新，不需要去setState，而且是局部刷新
///子widget里拿全局数据方便，直接用Controller拿就行了,而且controller不用手动去remove/dispose，自己可以回收

///Get的三大支柱：状态管理，路由管理，依赖管理
///状态管理分：GetBuilder(单纯的状态管理)和GetX/Obx(响应式的状态管理)
///使用响应式的状态管理的时候，引入值的Widget里面记得用Obx(()=> xxx),Obx本质是继承于StatefulWidget
class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(child: ElevatedButton(child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}

class Controller extends GetxController {
  var count = 0.obs;

  increment() => count++;
}
