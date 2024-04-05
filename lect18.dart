void main() {
  print('Hello, World!');
  Car myCar = Car('red', 100.0);
}

class Car {
  String? colour;
  double? speed;

  Car(String colour, double speed) {
    this.colour = colour;
    this.speed = speed;
  }
}
