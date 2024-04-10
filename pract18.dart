void main() {
  Person alice = Person('Alice', 20);
  alice.age = 21;
  print('Alice is ${alice.age} years old');

  print('Next year, Alice will be ${alice.ageNextYear()} years old');
  print('Can Alice vote? ${alice.canVote()}');

  print(alice);
  print(alice.runtimeType);
}

class Person {
  String name = 'unknown';
  int age = 0;

  Person(String name, int age) {
    this.name = name;
    this.age = age;
  }

  int ageNextYear() {
    return age + 1;
  }

  bool canVote() {
    if (age >= 18) {
      return true;
    } else {
      return false;
    }
  }

  String toString() {
    return 'Person(name: $name, age: $age)';
  }
}
