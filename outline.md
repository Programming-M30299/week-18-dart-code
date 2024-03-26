# Object-Oriented Programming in Dart

## Instance variables and constructors

Let's define a class `Person` with two instance variables `name` and `age`.
```dart
class Person {
  String name;
  int age;
}
```
When you run the code you will get the following error:
```
lect18.dart:42:10: Error: Field 'name' should be initialized because its type 'String' doesn't allow null.
  String name;
         ^^^^
lect18.dart:43:7: Error: Field 'age' should be initialized because its type 'int' doesn't allow null.
  int age;
      ^^^
```
One way to fix this error is set default values for the instance variables:
```dart
class Person {
  String name = 'unknown';
  int age = 0;
}
```
Another way to fix this issue is to declare these variables as nullable (and define a value for them in the constructor):
```dart
class Person {
  String? name;
  int? age;
  
  Person(String inputName, int inputAge) {
    name = inputName;
    age = inputAge;
  }
}
```
Pay attention to the syntax and compare it with Python. Note that we define the instance variables outside all other methods in Dart (outside the constructor). We don't use the `self` keyword in Dart. All other methods added to the `Person` class (between the curly braces) will be able to use the instance variables `name` and `age` without being passed any arguments (no need to pass `self` as a parameter in Dart).

Also, we don't have a special method like `__init__` in Dart. Instead, we define a constructor with the same name as the class.

## Constructing an instance of a class

Constructing an object based on a class is similar to Python. We use the name of the class followed by parentheses. If the class has a constructor, we pass the required arguments to the constructor:
```dart
void main() {
  Person alice = Person('Alice', 20);
  print(alice.name); // Alice
  print(alice.age); // 20
}
```
Pay attention to how we accessed the instance variables with the dot (`.`) operator. All instance variables are by default accessible using the dot operator (we will learn how to limit this accessibility later).

## Shorter way to define instance variables and constructors

We can define the instance variables and the constructor in a shorter way:
```dart
class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
}
```
This way we don't need to declare our instance variables as nullable as we are guaranteed to pass values to them when creating an instance of the class. The `this` keyword is used to refer to the instance variables of the class.

## Constructors with required and nullable parameters