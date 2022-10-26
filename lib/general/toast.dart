import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showLongToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
  );
}

void showShortToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
  );
}

void showCenterShortToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
  );
}

void showCenterLongToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void showCenterErrorShortToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    backgroundColor: Colors.red[900],
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
  );
}

void showCenterErrorLongToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    backgroundColor: Colors.red[900],
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void showTopShortToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
  );
}

void cancelToast() {
  Fluttertoast.cancel();
}
