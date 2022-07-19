void main() {
  // test5();
  error2();
}

///有onError的时候catchError没效果
void test1() {
  Future(() {
    print('a');
    assert(1 == 2);
  }).catchError(() {
    print('catchError');
  }).onError((error, stackTrace) {
    print('onError');
    print(error.toString());
  });
}

///Future报错的话，then不会执行
void test2() async {
  Future(() {
    print('a');
    //assert(1 == 2);
  }).then((value) {
    print('then $value');
  });
  Future(() {
    print('b');
    assert(1 == 2);
  }).then((value) {
    print('then $value');
  });
}

///async/await里Future出错了，后面的代码泡不到，这个和test2其实是一样的，因为await后面的内容可以理解成就是then
void test3() async {
  await Future(() {
    print('c');
    assert(1 == 2);
  });
  print('dddd');
}

///test4和test5等效，dddd都会打印
///但是test6又不一样，test6的dddd并不会打印，注意区分，test6的then紧接在报错的那个Future后面，所以跑不到
///而test5里的then是跑在onError这个Future后面，onError这个Future实际是没报错的，所以then跑到了
///后续写代码，这种多个方法并排的还得注意下顺序
void test4() async {
  await Future(() {
    print('c');
    assert(1 == 2);
  }).onError((error, stackTrace) {
    print('onError $error');
  });
  print('dddd');
}

void test5() async {
  await Future(() {
    print('c');
    assert(1 == 2);
  }).onError((error, stackTrace) {
    print('onError $error');
  }).then((value) {
    print('dddd');
  });
}

void test6() async {
  await Future(() {
    print('c');
    assert(1 == 2);
  }).then((value) {
    print('dddd');
  }).onError((error, stackTrace) {
    print('onError $error');
  });
}

///Future的error实际是Future的构造方法，也就是说Future.error实际是一个Future，所以b会跑在它前面
///就直接这么些，打印log会提示有个Unhandled exception:
///但是不影响啥
void error1() {
  try {
    print('a');
    assert(1 == 2);
  } catch (e) {
    print(e.toString());
    Future.error(e);
    print('b');
  }
}

///需要加个onError在未来去handle这个error，说白了就是把error放到未来去处理。
void error2() {
  try {
    print('a');
    assert(1 == 2);
  } catch (e) {
    print(e.toString());
    Future.error(e).onError((error, stackTrace) {
      print('ccc $error');
    });
    print('b');
  }
}
