import 'dart:io';

void main() {
  //test1();
  //test2();
  //test3();
  //test4();
  test5();
}

//输出结果abcd,即使是睡了2s，因为Future是插入到Event Queue里面，作为下一个Event执行，dart是单线程模型。
// Future并非是并行执行的,这里要和java里的new Thread要区分开
void test1() {
  print('a');
  Future(() {
    print('c');
  }).then((_) {
    print('d');
  });
  sleep(Duration(seconds: 2));
  print('b');
}

//Future，catchError
void test2() {
  Future(() {
    //print('a');
    throw AssertionError('Error');
  }).then((_) {
    //执行成功走b
    print('b');
  }).catchError((e) {
    //执行失败走c
    print('c');
    print(e);
  }).whenComplete(() {
    //失败成功都会走
    print('d');
  });
}

//Future wait 可以等待多个异步任务结束
void test3() {
  print(DateTime.now());
  Future.wait([
    Future.delayed(Duration(seconds: 2), () {
      print('a');
      print(DateTime.now());
    }),
    Future.delayed(Duration(seconds: 4), () {
      print('b');
      print(DateTime.now());
    }),
  ]).then((value) {
    print(value);
  });
}

//then方法返回的是一个Future，可以链式调用
void test4() {
  Future(() {
    print('a');
  }).then((_) {
    print('b');
  }).then((_) {
    print('c');
  }).then((_) {
    print('d');
  });
}

//Stream, 一个任务执行完，listen回调一次
void test5() {
  Stream.fromFutures([
    // 1秒后返回结果
    Future.delayed(Duration(seconds: 1), () {
      return "hello 1";
    }),
    // 抛出一个异常
    Future.delayed(Duration(seconds: 2), () {
      throw AssertionError("Error");
    }),
    // 3秒后返回结果
    Future.delayed(Duration(seconds: 3), () {
      return "hello 3";
    })
  ]).listen((data) {
    print(DateTime.now());
    print(data);
  }, onError: (e) {
    print(e.message);
  }, onDone: () {});
}
