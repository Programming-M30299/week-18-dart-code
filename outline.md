# Object-Oriented Programming in Dart

## Defining a class and constructor

Let's define a class `Person` with two instance variables `name` and `age`.
```dart
class Person {
  String name;
  int age;
}
```
When you run the code you will get the follwing error:
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