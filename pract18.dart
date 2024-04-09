void main() {
  Person alice = Person('Alice', 20);
  print(alice.name);
  print(alice.age);
}

class Person {
  String name = 'unknown';
  int age = 0;

  Person(String name, int age) {
    this.name = name;
    this.age = age;
  }
}
