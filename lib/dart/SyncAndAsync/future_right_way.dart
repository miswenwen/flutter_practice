/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
void main() {
  //test3();
  myErrorA();
  myErrorB();
}

///onError和catchError区别
///都可以处理调用链的里的异常，例如Future,then,then,then,then,then,最后加个onError或者catchError，其实是等效的。中间有error都能跑进去
///差异有三点：
///1.onError可以制定错误类型，比如是数组越界的错误类型，还是网络错误的类型，而且onError可以打印堆栈信息
///2.then方法是有可选命名参数onError，用于捕获调用这个then的Future所产生的错误，参考errorTest3
///3.onError默认打印的error信息是比较完整的，api的调用链都能看到，而catchError打印e默认就只有一个是什么类型的错误

///这里的myErrorA和myErrorB是等效的
void myErrorA() {
  Future(() {
    print('a');
    assert(1 == 2);
  }).then((value) {
    print('b');
  }).catchError((e) {
    print('catchError $e');
  });
}

void myErrorB() {
  Future(() {
    print('a');
    assert(1 == 2);
  }).then((value) {
    print('b');
  }).onError((error, stackTrace) {
    print('onError $error');
  });
}

///这里走到b程序就退出了
void errorTest1() {
  Future(() {
    print('a');
  }).then((value) {
    print('b');
    assert(1 == 2);
  }).then((value) {
    print('c');
  }).then((value) {
    print('d');
  });
  Future(() {
    print('continue');
  });
}

///a,b,error,continue，这里的onError在外层，把Future的调用链全包住了
void errorTest2() {
  Future(() {
    print('a');
  }).then((value) {
    print('b');
    assert(1 == 2);
  }).then((value) {
    print('c');
  }).then((value) {
    print('d');
  }).onError((error, stackTrace) {
    print(error);
  });
  Future(() {
    print('continue');
  });
}

///ab error d continue
///这里实际是在then里面放了onError，把上面的那个Future的error捕获了，后面的代码还能继续跑
void errorTest3() {
  Future(() {
    print('a');
  }).then((value) {
    print('b');
    assert(1 == 2);
  }).then((value) {
    print('c');
  }, onError: (error, stackTrace) {
    print(error);
  }).then((value) {
    print('d');
  });
  Future(() {
    print('continue');
  });
}

///第一个Future跑在第二个前面
///因为报错，所以程序终止了，后面的Future没跑到，b就没打印
void test1() {
  Future(() {
    print('a');
    assert(1 == 2);
  });
  Future(() {
    print('b');
  });
}

///报错在onError里处理了，所以b能跑到
void test2() {
  Future(() {
    print('a');
    assert(1 == 2);
  }).onError((error, stackTrace) {
    print(error);
  });
  Future(() {
    print('b');
  });
}

///网络请求的future必须要加上onError把异常捕获。
void test3() {
  getNetRes().then((value) {
    print('then $value');
  }).onError((error, stackTrace) {
    print('onError');
  });
  Future(() {
    print('b');
  });
}

Future getNetRes() {
  return Future(() {
    print('a');
    assert(1 == 2);
    return 'success';
  });
}
