void main() {
  Car myCar = Car('red', 10.0);
  print(myCar.colour); // red
  print(myCar.speed); // 10.0

  myCar.speed = 20.0;
  print(myCar.speed); // 20.0
}

class Car {
  String? colour;
  double? speed;

  Car(String colour, double speed) {
    this.colour = colour;
    this.speed = speed;
  }
}
