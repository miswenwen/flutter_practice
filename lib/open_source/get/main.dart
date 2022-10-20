import 'package:flutter/material.dart';
import 'package:flutter_practice/open_source/get/plugin_learn/data_pass/a/a_view.dart';
import 'package:get/get.dart';

import 'locale/messages.dart';

//GetMaterialApp will create routes, inject them, inject translations, inject everything you need for route navigation.
// If you use Get only for state management or dependency management, it is not necessary to use GetMaterialApp.
// GetMaterialApp is necessary for routes, snackbars, internationalization, bottomSheets, dialogs, and high-level apis related to routes and absence of context.
//GetMaterialApp对路由管理来说是必须的，但是对状态管理和依赖管理来说不是必须的。总体来说能加就加上
void main() {
  runApp(
    GetMaterialApp(
      home: Learn(),
      translations: Messages(),
      //正常用这个即可，除非想要锁死成某种语言不跟系统语言变才定死
      locale: Get.deviceLocale,
      //locale: Locale('zh', 'CN'),
      //切换到某一语言，字串没有对应的value，就用这个语言的，这个语言如果都没有，应该就是'xxx'.tr的'xxx'本身这个字串，其实也是key本身
      fallbackLocale: Locale('en', 'US'),
    ),
  );
}

class Learn extends StatelessWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LearnGet'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: APage(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  ///controll是作为全局变量在对象新建的时候就创建的
  ///实测这个controller就是个单例，我从Home跳到PageA，再从PageA调到Home，可以看到controller里面的属性没有变，
  ///说明controller还是之前那个实例，我们打印了hashcode可以看到Home确实是两个不一样的实例

  ///put 还有tag以及 permanent 这两个可选参数，回头得看看对比看下，主要要搞清楚permanent对controller的生命周期的影响
  ///感觉如果是需要是跨页面的controll应该permanent搞成true，如果只是当前页面用的controller，那就用默认的false即可？
  ///但是实测又有些奇怪，因为默认的permanent是false，为什么我从Home， off跳转到其他页面，甚至中间穿插了一个空页面的情况下，最后到了PageB
  ///还可以引用到controller，说明Home页面销毁的时候它没被回收啊，莫名其妙。源码注释里的Get.smartManagement具体是个什么策略？？
  ///可以参考https://github.com/jonataslaw/getx/blob/master/documentation/en_US/dependency_management.md#smartmanagement
  ///上面这个没看太明白，https://stackoverflow.com/questions/72300210/what-are-the-memory-management-differences-between-get-putsomeclass-permanent
  ///这个stackoverflow倒是有一些借鉴意义
  ///说是permanent:false绑定的是navigation stack，也就是只要路由栈里没有清空，就不销毁，而permanent:true则是整个应用的生命周期，因为有些应用以android为例，可以只有service没有activity
  ///如果是这样的话，倒是可以解释的通我上面的实测结果，也可以解释官方demo，在路由栈非空，跳转路由的时候，它的demo没有把permanent指定为true。
  ///那这样的话移动的大部分需求，其实用默认的false就够了
  final MyController controller = Get.put(MyController());
  int intTest = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetLearn'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Obx实际返回的是一个Widget，Obx继承了StatefulWidget，这也解释了为什么能实现局部刷新
            Obx(() => Text('${controller.count}')),
            Text('${controller.count}'),
            Text('$intTest'),
            //这两个hashcode 是为了验证controller是否是个全局单例，追源码和实测确实如此，准确说是没有声明tag的情况下这样
            Text('Home hashcode' + this.hashCode.toString()),
            Text('controller hashcode' + this.controller.hashCode.toString()),
            Text('hello'.tr), //tr是translate的缩写
            ElevatedButton(
              onPressed: () => controller.count++,
              child: Text('+1'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(PageA());
              },
              child: Text('Get To PageA'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(PageNothing());
              },
              child: Text('Get Off PageNothing'),
            ),
            ElevatedButton(
              onPressed: () {
                //这里挺好的，相比官方的intl要好用，之前intl follow官方教程也走通了
                //但是没有继续去看怎么修改语言后，app UI跟着同步刷新而Get里面帮我们实现了
                //intl的应用场景呢？  广谱性更好吗 ，比如可以跑在非移动端平台，因为作者是dart.dev. 没有在非移动端平台和get进行比对
                //后续直接用Get处理国际化需求即可
                //还有个重要的区别在于用Get的Locale，翻译的k-v对显然是存放在内存里面的，而intl则是生成的文件存储在本地的。如果翻译内容很多的话，如何选择其实一目了然。android原生的也是放在本地的xml里面的。
                var locale = Locale('zh', 'CN');
                Get.updateLocale(locale);
              },
              child: Text('locale change to zh CN'),
            ),
            ElevatedButton(onPressed: () {}, child: Text('')),
            ElevatedButton(onPressed: () {}, child: Text('')),
            ElevatedButton(onPressed: () {}, child: Text('')),
            ElevatedButton(onPressed: () {}, child: Text('')),
            ElevatedButton(onPressed: () {}, child: Text('')),
            ElevatedButton(onPressed: () {}, child: Text('')),
            ElevatedButton(onPressed: () {}, child: Text('')),
          ],
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  var count = 0.obs;
}

class PageNothing extends StatelessWidget {
  const PageNothing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageB'),
      ),
      body: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              Get.to(PageA());
            },
            child: Text('Get To PageA'),
          ),
        ],
      ),
    );
  }
}

class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //这里就直接可以拿到controller，有点神奇，难道它不可能为null吗，如果我不是从Home跳过来的
    //实测了下，如果Home之前没初始化就直接报错了，not found
    //实测如果从Home那边跳转过来，如果把Home销毁了，也就是Get.off过来，controller对象依然全局存在，其实和个全局的单例很类似。
    MyController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('PageA'),
      ),
      body: Column(children: [
        Text('${controller.count}'),
        OutlinedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('back'),
        ),
        OutlinedButton(
          onPressed: () {
            Get.to(Home());
          },
          child: Text('Get To Home Page'),
        ),
      ]),
    );
  }
}
