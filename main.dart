import 'lect18.dart';
import 'pract18.dart';

void main() {
  // Code for lecture
  BankAccount myAccount = BankAccount('Mani');
  print(myAccount.owner);

  myAccount.deposit(100.0);
  myAccount.withdraw(150.0); // should not withdraw

  print(myAccount.balance); // 100.0
  myAccount.balance = 200.0;
  print(myAccount.balance); // 200.0
  myAccount.balance = -50.0; // should not set
  print(myAccount.balance); // 200.0

  // Code for practical
  Student devki = Student('Devki', '07123456789');
  print(devki.name);
  print(devki.level);
  devki.phoneNumber = ''; // should not set
  print(devki.phoneNumber); // gets the last 4 digits
  devki.phoneNumber = '07987654321'; // sets the phone number

  Module programming = Module('Programming', credits: 40);
  Module databases = Module('Databases');

  Course computing = Course('Computing');
  computing.addModule(programming);
  computing.addModule(databases);

  print(computing.modules);

  Shape square = Shape(1, 1);
  Circle circle = Circle(2, 2, 3);
  print("Square's x: ${square.x}, y: ${square.y}");
  print("Circle's x: ${circle.x}, y: ${circle.y}, radius: ${circle.radius}");
  square.move(2, 2);
  print("Square's x: ${square.x}, y: ${square.y}");
  circle.move(3, 3);
  print("Circle's x: ${circle.x}, y: ${circle.y}, radius: ${circle.radius}");
}
