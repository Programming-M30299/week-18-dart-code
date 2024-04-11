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

  print(myCar); // Car(colour: blue, speed: 0.0)
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

  String toString() {
    return 'Car(colour: $colour, speed: $speed)';
  }
}

class BankAccount {
  String owner;
  double _balance = 0.0;

  BankAccount(this.owner);

  void deposit(double amount) => _balance += amount;

  void withdraw(double amount) {
    if (_balance - amount >= 0) {
      _balance -= amount;
    }
  }

  // Not needed anymore as we have balance getter and setter below
  // double getBalance() => _balance;

  // double get balance {
  //   return _balance;
  // }

  // Getter using arrow syntax
  double get balance => _balance;

  void set balance(double amount) {
    if (amount >= 0) {
      _balance = amount;
    }
  }
}
