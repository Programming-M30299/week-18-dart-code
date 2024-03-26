void main() {
  print('Hello, World!');

  // Instantiation of `Person` with named parameters
  // Person person = Person(inputAge: 25, inputName: 'John');
}

class Person {
  // String name = 'unknown';
  // int age = 0;

  // Constructor with positional parameters
  // Person(String inputName, int inputAge) {
  //   name = inputName;
  //   age = inputAge;
  // }

  // String? name;
  // int? age;

  // // Constructor with required named parameters
  // Person({required String inputName, required int inputAge}) {
  //   name = inputName;
  //   age = inputAge + 10;
  // }

  // String name = 'unknown';
  // int? age;

  // // Constructor with a nullable and a required named parameter
  // Person({String? inputName, required int inputAge}) {
  //   age = inputAge;
  //   if (inputName != null) {
  //     name = inputName;
  //   }
  // }

  // String? name;
  // int? age;

  // Shorter way to define a constructor
  // Person(this.name, this.age);

  // void show() {
  //   print('Name: $name, Age: $age');
  // }

  String? name;
  int? age;

  Person(int age, String name) {
    this.age = age;
    this.name = name;
  }
}
