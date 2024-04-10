void main() {
  Car myCar = Car('red', 10.0);
  print(myCar.colour); // red
  print(myCar.speed); // 10.0
  myCar.colour = 'blue';
  print(myCar.colour); // blue

  myCar.accelerate(10);
  print(myCar.speed); // 20.0
  myCar.brake();
  print(myCar.speed); // 0.0
}

class Car {
  String colour;
  double speed;

  Car(this.colour, this.speed);

  void accelerate(double inc) {
    speed += inc;
  }

  void brake() {
    speed = 0;
  }
}
