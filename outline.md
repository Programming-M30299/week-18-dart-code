# Object-Oriented Programming in Dart

## Lecture notes

### Classes and objects

Here's a class that represents a car:
```dart
class Car {
  String colour = "";
  double speed = 0.0;

  Car(String inputColour, double inputSpeed) {
    colour = inputColour;
    speed = inputSpeed;
  }
}
```

The class has two instance variables `colour` and `speed`. The class also has a constructor that takes two parameters (`inputColour` and `inputSpeed`) and assigns them to the instance variables. The constructor has the same name as the class.

The name of the parameters don't need to be different to the instance variables. We could rename them to match as shown below. However you need to add `this.` before the instance variables to distinguish them from the parameters:
```dart
class Car {
  String colour = "";
  double speed = 0.0;

  Car(String colour, double speed) {
    this.colour = colour;
    this.speed = speed;
  }
}
```

The instance variables have a default value. We could also define them as nullable (hence the `?` after the data type) and set their value in the constructor:
```dart
class Car {
  String? colour;
  double? speed;

  Car(String colour, double speed) {
    this.colour = colour;
    this.speed = speed;
  }
}
```

To construct an instance of this class we use the class name followed by parentheses. If the class has a constructor, we pass the required parameters to the constructor. In this case we pass a colour and a speed to create a new car:
```dart
void main() {
  Car myCar = Car('red', 10.0);
  print(myCar.colour); // red
  print(myCar.speed); // 10.0
}
```

To access the instance variables we use the dot (`.`) operator. We can also modify the instance variables using the dot operator:
```dart
  myCar.speed = 20.0;
  print(myCar.speed); // 20.0
```

We can additionally get an object's data type using the `runtimeType` property (all objects in Dart have this property):
```dart
  print(myCar.runtimeType); // Car
```

### Class members and encapsulation

### Composition and inheritance

## Worksheet

### Instance variables and constructors

Let's define a class `Person` and declare two instance variables `name` and `age` with their data types.
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

The name of the parameters in the constructor don't need to be different to the instance variables. We could rename them to match as shown below. However you need to add `this.` before the instance variables to distinguish them from the parameters:
```dart
class Person {
  String? name;
  int? age;
  
  Person(String name, int age) {
    this.name = name;
    this.age = age;
  }
}
```

Read the first line inside the constructor as: "Set this object's name to be the name passed as the parameter". The same goes for the line defining a value for `age` instance variable.

### Constructing an instance of a class

Constructing an object based on a class is similar to Python. We use the name of the class followed by parentheses. If the class has a constructor, we pass the required arguments to the constructor:
```dart
void main() {
  Person alice = Person('Alice', 20);
  print(alice.name); // Alice
  print(alice.age); // 20
  alice.age = 21
  print(alice.age); // 21
}
```
Pay attention to how we can access and modify the instance variables with the dot (`.`) operator. All instance variables are by default accessible using the dot operator and we don't need accessor or mutator methods to use them (we will learn how to limit this accessibility later).

We can additionally get an object's data type using the `runtimeType` property (all objects in Dart have this property):
```dart
  print(alice.runtimeType); // Person
```

### Shorter way to define instance variables and constructors

We can define the instance variables and the constructor in a shorter way:
```dart
class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
}
```
This way we don't need to declare our instance variables as nullable as we are guaranteed to pass values to them when creating an instance of the class. The `this` keyword is used to refer to the instance variables of the class.

### Constructors with required and nullable parameters

We've already seen examples of functions with named parameters and how these parameters can be marked as required. In the following version of our `Person` class, both parameters are required:
```dart
class Person {
  String? name;
  int? age;

  // Constructor with required named parameters
  Person({required String inputName, required int inputAge}) {
    name = inputName;
    age = inputAge + 10;
  }
}
```

Remember that given this constructor, we must instantiate a `Person` object as shown below:
```dart
  Person john = Person(inputAge: 25, inputName: 'John');
```

We can also define default values for some of our instance variables and mark them as nullable in the constructor (in this case, `name` is nullable):
```dart
class Person {
  String name = 'unknown';
  int? age;

  // Constructor with a nullable and a required named parameter
  Person({String? inputName, required int inputAge}) {
    age = inputAge;
    if (inputName != null) {
      name = inputName;
    }
  }
}
```

This way we can instantiate a `Person` object with just the `age`:
```dart
  Person john = Person(inputAge: 25);
  Person john = Person(inputAge: 25, inputName: 'John');
```

### Methods

We can define methods in a class in a similar way to Python. Here's an example of a class `Student` class with two methods `graduate` and `greet`:
```dart
class Student {
  String? name;
  int level = 4;

  Student(this.name, this.level, this._phoneNumber);

  void graduate() {
    level++;
  }

  String greet() => 'Hello, $name!';
}
```

Note that `greet` is written using the arrow syntax. We can use these methods as shown below:
```dart
void main() {
  Student alice = Student('Alice', 4);
  print(alice.greet()); // Hello, Alice!
  alice.graduate();
  print(alice.level); // 5
}
```

### Encapsulation

In Dart, similar to Python, we can define instance variables as private by prefixing them with an underscore (`_`). This way they can only be accessed from within the library (the file) they are defined in. This is a way to encapsulate the data and prevent it from being modified from outside the class.

We can still define public methods to access and modify these private instance variables. Encapsulation is a way to control how the data is accessed and modified and to prevent invalid data from being assigned to the instance variables.

Suppose every student also has a phone number. We can define a private instance variable `_phoneNumber` and a public method `setPhoneNumber` to set the phone number:
```dart
class Student {
  String? name;
  int level = 4;
  String? _phoneNumber;

  Student(this.name, this.level, this._phoneNumber);

  void graduate() {
    level++;
  }

  String greet() => 'Hello, $name!';

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }
}
```

To access the phone number we can define a public method `getPhoneNumber`. But in this method, instead of returning the entire phone number, we want to only return the final 3 digits of the phone number. We can do this as shown below:
```dart
  String getPhoneNumber() {
    int length = _phoneNumber!.length;
    String lastThreeDigits = _phoneNumber!.substring(length - 3);
    return 'Phone number ending in $lastThreeDigits';
  }
```

In a different file import the `pract18.dart` file and create an instance of the `Student` class. Set the phone number using the `setPhoneNumber` method and print the phone number using the `getPhoneNumber` method. See below:

```dart
import 'pract18.dart';

void main() {
  Student alice = Student
  alice.setPhoneNumber('1234567890');
  // alice._phoneNumber = '1234567890'; // This will give an error
  print(alice.getPhoneNumber()); // Phone number ending in 890
}
``` 

Try uncommenting the line `alice._phoneNumber = '1234567890';` and see what happens.
This error happens because `_phoneNumber` is a private instance variable and can only be set using the `setPhoneNumber` method. We could also define out own setter method to allow us to set the phone number directly:
```dart
  void set phoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }
```

And with the arrow syntax:
```dart
  void set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;
```



## Programming exercises

Here is an example of a programming exercise. I have not spend enough time to think about this and make it a good exercise. Can you think of better exercises?

1. Write a class representing a patient in a hospital. Each patient has an age, a name, and a list of symptoms. They also have a diagnosis which at the beginning is an empty string. The class should have a method `add_symptom` that receives a symptom and adds it to the list of symptoms. The class should also have a method `diagnose` that receives a diagnosis and sets the patient's diagnosis to the received diagnosis. There are some aspects of the class that must be kept private. Make sure that the class is well encapsulated and that the instance variables are not accessible from outside the class. Instead the user needs to use the methods provided by the class to interact with the object.