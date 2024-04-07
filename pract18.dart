void main() {
  Shape s = new Shape(10.0, 20.0);
  print(s);
  Circle c = new Circle(100.0, 200.0, 50.0);
  print(c);
}

class Shape {
  double x = 0.0;
  double y = 0.0;

  Shape(this.x, this.y);

  void move(double dx, double dy) {
    x += dx;
    y += dy;
  }

  String toString() {
    return 'x: $x, y: $y';
  }
}

class Circle extends Shape {
  double radius = 0.0;

  // Circle(double x, double y, this.radius) : super(x, y);

  Circle(double x, double y, double radius) : super(x, y) {
    this.radius = radius;
  }

  String toString() {
    return '${super.toString()}, radius: $radius';
  }
}
