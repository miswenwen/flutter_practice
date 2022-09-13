void main() {}

class Rect {
  var width;
  var height;

  Rect(this.width, this.height);

  get area => width * height;

  calArea() {
    return width * height;
  }

  set area(a) {}

  final _scale = 1.0;
  get scale => _scale;
  getScale() {
    return _scale;
  }
}
