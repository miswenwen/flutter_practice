void main() {
  var arr = [5, 6, 1, 3, 0, 4, 7, 9];
  var index = [2, 0, 1, 4, 6, 2, 5, 0, 1, 7, 3];
  var tel = '';
  for (int i = 0; i < index.length; i++) {
    tel += arr[index[i]].toString();
  }
  print(tel);
}
