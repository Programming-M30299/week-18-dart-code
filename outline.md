# Object-Oriented Programming in Dart

## Lecture notes

### Basics of classes

Here's a class that represents a car:
```dart
class Car {
  String colour = '';
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

Methods in Dart, similar to Python, are functions defined inside a class. In Dart, we write them inside the curly braces of the class. Here are the accelerate and brake methods for the Car class:
```dart
class Car {
  String colour = '';
  double speed = 0.0;

  Car(String colour, double speed);

  void accelerate() {
    speed += 10;
  }

  void brake() {
    speed = 0;
  }
}
```

We could have also defined them using the arrow syntax:
```dart
  void accelerate() => speed += 10;
  void brake() => speed = 0;
```

### Encapsulation

To demonstrate this concept, take the following `BankAccount` class that has two instance variables `owner` and `balance`:
```dart
class BankAccount {
  String owner;
  double balance = 0.0;

  BankAccount(this.owner);
}
```

One major issue with this class is that the `balance` instance variable is public. This means that the balance can be modified directly from outside the class. To see this, create a new file in your directory, called `main.dart`, and import the `lect18.dart` file and create an instance of the `BankAccount` class:
```dart
import 'lect18.dart';

void main() {
  BankAccount account = BankAccount('Alice');
  account.balance = 20.0;
  print(account.balance); // 20.0
  account.balance = -50.0;
  print(account.balance); // -50.0
}
```

Observe that we can freely modify the balance of the account directly. This is a problem because it allows invalid values to be assigned to the balance. We want to prevent this by encapsulating the balance and providing controlled access to it (e.g., preventing negative balances).

Encapsulation is a key principle in object-oriented programming (OOP) that involves bundling data and methods within a class and restricting direct access to the data from outside the class. By using access modifiers like `private`, we can hide the internal details of a class and provide controlled access to the data through methods known as getters and setters.

Encapsulation is important for two main reasons:
1. Data hiding: It prevents unauthorized modification of data and maintains the integrity of an object's state.
2. Controlled access: It allows data to be accessed and modified through well-defined methods that can include validation and error checking.

In the given example, the `BankAccount` class demonstrates encapsulation by using a private instance variable `_balance` to store the account balance. The balance is protected from direct access and modification from outside the class. Instead, the `deposit` and `withdraw` methods provide controlled access to modify the balance, including validation checks.

To access the balance without modifying it directly, a getter method `balance` is defined. This allows reading the balance value while preventing direct modification.

This example showcases how encapsulation helps protect sensitive data, provides controlled access, and maintains the consistency and integrity of an object's state.

```dart
class BankAccount {
  String owner;
  double _balance = 0.0;

  BankAccount(this.owner, this._balance);

  // The balance should be private because it's sensitive information.
  // We can control its access through public methods.
  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    } else {
      throw Exception('Deposit amount must be positive');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
    } else {
      throw Exception('Invalid withdrawal amount');
    }
  }
}
```

To try out the encapsulation, we must first create a new file, called `main.dart`, and import the `lect18.dart` file. Then we can create an instance of the `BankAccount` class and try to access and modify the balance:

```dart
import 'lect18.dart';

void main() {
  BankAccount account = BankAccount('Alice');
  // print(account.balance); // Error: The getter 'balance' isn't defined for the class 'BankAccount'.
}
```

If you try to access the balance directly, you will get an error because the balance is a private instance variable. Instead, we can use the `deposit` and `withdraw` methods to modify the balance:

```dart
  account.deposit(50.0);
  account.withdraw(25.0);
```

To see the value of the balance, we can add a getter method to get the balance of the account. This way we can access the balance without being able to modify it.

```dart
  double get balance => _balance;
```

Pay attention to the syntax of the getter method. We use the `get` keyword followed by the name of the method (`balance`) and the return type of the method (`double`). This method allows us to access the balance without being able to modify it directly.

```dart
  print(account.balance); // 25.0
```

But we don't want to allow the balance to be modified directly so we limit the changes to the balance through the `deposit` and `withdraw` methods.

If you were to allow the balance to be modified directly, you could define a setter method to set the balance. This way you can control how the balance is modified and add validation checks if necessary.

```dart
  void set balance(double newBalance) {
    if (newBalance >= 0) {
      _balance = newBalance;
    } else {
      throw Exception('Balance cannot be negative');
    }
  }
```

### Composition and inheritance

#### Composition

There is nothing special about composition in Dart.  Here is an example of a `Recipe` class that is composed of a set of `Ingredient` objects:

```dart
class Ingredient {
  String name;
  int calories;

  Ingredient(this.name, this.calories);

  String toString() => '$name ($calories calories)';
}

class Recipe {
  String name;
  Set<Ingredient> ingredients = {};

  Recipe(this.name);

  String toString() => '$name: $ingredients';
}
```

What is worth noting is the data type of `ingredients` which is a set of `Ingredient` objects (hence `Set<Ingredient>`).

We've decided to define the initial value of the `ingredients` set as an empty set. This way we can add ingredients to it later using a method:

```dart
  void addIngredient(Ingredient ingredient) {
    ingredients.add(ingredient);
  }
```

Let's create a few ingredients in the `main` function and add them to a recipe:
```dart
void main() {
  Ingredient pasta = Ingredient('Pasta', 200);
  Ingredient tomatoSauce = Ingredient('Tomato Sauce', 100);
  Recipe pastaRecipe = Recipe('Pasta');
  pastaRecipe.addIngredient(pasta);
  pastaRecipe.addIngredient(tomatoSauce);
  print(pastaRecipe); // Pasta: {Pasta (200 calories), Tomato Sauce (100 calories)}
}
```

To calculate the total calories of a recipe we can define a method `totalCalories` as shown below:

```dart
  int totalCalories() {
    int total = 0;
    for (Ingredient ingredient in ingredients) {
      total += ingredient.calories;
    }
    return total;
  }
```

Here, `Ingredient` is the data type of the loop variable `ingredient`. This is because the elements of the `ingredients` set are of type `Ingredient`.
`ingredient.calories` is accessing the `calories` instance variable of the `Ingredient` object and adding it to the total.

Let's add a string representation method to the `Ingredient` class:

```dart
  String toString() {
    return '$name ($calories calories)';
  }
```

Now we are going to use this to write a string representation method for the `Recipe` class:

```dart
  String toString() {
    String result = '$name\n';
    for (Ingredient ingredient in ingredients) {
      result += '  $ingredient\n';
    }
    result += 'Total calories: ${totalCalories()}';
    return result;
  }
```

In the line `result += '  $ingredient\n';` we are using the `toString` method of the `Ingredient` class to get a string representation of the ingredient.

#### Inheritance

Lastly, let's discuss inheritance in Dart. Let's start with a simple example:
```dart
class Meal {
  String burger;
  String drink;

  Meal(this.burger, this.drink);

  String toString() {
    return '$burger, $drink and chips';
  }
}

class KidsMeal extends Meal {
  String toy;

  KidsMeal(String burger, String drink, this.toy) : super(burger, drink);

  String toString() {
    return '${super.toString()} and $toy';
  }
}
```

Inheritance in Dart is defined using the `extends` keyword followed by the superclass. In this case, `KidsMeal` is a subclass of `Meal`.

The subclass' constructor must call the superclass' constructor using the `super` keyword. In this case, we are passing the `burger` and `drink` parameters to the superclass constructor (`super(burger, drink)`). Pay attention to the placement of the `super` call.

If we were to use curly braces in the constructor of the superclass, we would need to call the superclass constructor before the opening curly brace of the subclass constructor. For example:
```dart
  KidsMeal(String burger, String drink, this.toy) : super(burger, drink) {
    // Additional initialization code
  }
```

Another thing that is worth noting is the `toString` method of the `KidsMeal` class. We are using the `super` keyword to call the `toString` method of the superclass and add the toy to it. Let's see this in action:

```dart
void main() {
  Meal meal = Meal('Big Mac', 'Coke');
  print(meal); // Big Mac, Coke and chips

  KidsMeal kidsMeal = KidsMeal('Happy Meal', 'Sprite', 'Toy car');
  print(kidsMeal); // Happy Meal, Sprite and chips and Toy car
}
```

In this example, we have a `Meal` class that represents a meal with a burger and a drink. We also have a `KidsMeal` class that extends the `Meal` class and adds a toy to the meal. The `KidsMeal` class overrides the `toString` method to include the toy in the string representation.

When we create instances of the `Meal` and `KidsMeal` classes and print them, we see the string representation of the objects. The `KidsMeal` object includes the toy in the string representation, demonstrating the inheritance and method overriding in Dart.

Let's see another example of inheritance in Dart where the subclass has additional methods.
Here is an example of a `Bird` class and a `Parrot` subclass:

```dart
class Bird {
  bool canFly;
  String name;

  Bird(this.name, {this.canFly = true});

  String toString() {
    return 'Name: $name, Can fly: $canFly';
  }
}

class Parrot extends Bird {
  Parrot(String name) : super(name);

  String toString() {
    return '${super.toString()}, Can speak: true';
  }

  void speak() {
    print('Hello, my name is $name');
  }
}
```

The constructor of the `Bird` class takes a `name` and an optional parameter `canFly` that defaults to `true`. The `toString` method of the `Bird` class returns a string representation of the bird's name and whether it can fly.

The constructor of the `Parrot` class calls the superclass constructor passing the `name` parameter. Since we don't pass any value for `canFly`, it will default to `true` (simply put, all parrots can fly).

Parrots have an additional method `speak` that prints a message. Let's see this in action:

```dart
void main() {
  Bird bird = Bird('Sparrow', canFly: true);
  print(bird); // Name: Sparrow, Can fly: true
  // bird.speak(); // Error: The method 'speak' isn't defined for the class 'Bird'

  Parrot parrot = Parrot('Polly');
  print(parrot); // Name: Polly, Can fly: true, Can speak: true
  parrot.speak(); // Hello, my name is Polly
}
``` 

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

### String representation of an object

Recall that in Python we can define a special method `__str__` to return a string representation of an object. In Dart, we can define a method `toString` to return a string representation of an object. Here's an example of a `Person` class with a `toString` method:
```dart
class Person {
  String name = 'unknown';
  int age = 0;

  Person(this.name, this.age);

  String toString() {
    return 'Name: $name, Age: $age';
  }
}
```

You could also write this method using the arrow syntax:
```dart
  String toString() => 'Name: $name, Age: $age';
```

Once you have added the `toString` method to the `Person` class you can print an object of this class as shown below:
```dart
void main() {
  Person alice = Person('Alice', 20);
  print(alice); // Name: Alice, Age: 20
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

Create a new file in your directory, called `main.dart`, and import the `pract18.dart` file and create an instance of the `Student` class.
Set the phone number using the `setPhoneNumber` method and print the phone number using the `getPhoneNumber` method. See below:

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

After you define this method you can set the phone number, inside the `main.dart` file, as shown below:
```dart
  alice.phoneNumber = '1234567890';
```

### Composition

Composition in Dart is similar to Python. Here we have two classes `Module` and `Course`. A `Course` is composed of multiple `Module`s. We can define the `Course` class as shown below:
```dart
class Module {
  String name;
  int credits = 20;

  Module(this.name, this.credits);
}

class Course {
  String name;
  List<Module> modules = [];

  Course(this.name);
}
```

Pay attention to the data type of `modules` which is a list of `Module` objects (hence `List<Module>`).

We are assuming that all modules are by default worth 20 credits. 
We've also left the module list of the course empty so we can add modules to it later using a method.

Define a method `addModule` shown below in `Course` class that let's us add a `module` to the list of modules in a course:
```dart
  void addModule(Module module) {
    modules.add(module);
  }
```

Let's slightly change our course class to define a maximum credits (120 for all courses) and also check to ensure that adding a module to the course doesn't exceed the maximum credits:
```dart
class Course {
  String name;
  List<Module> modules = [];
  int totalCredits = 0;
  int _maxCredits = 120;

  Course(this.name);

  void addModule(Module module) {
    if (totalCredits + module.credits <= maxCredits) {
      modules.add(module);
      totalCredits += module.credits;
    } else {
      print('Cannot add module. Exceeds maximum credits.');
    }
  }

  int get maxCredits => _maxCredits;

  int get totalCredits => totalCredits;
}
```

Pay attention to the fact that we cannot set the value of `maxCredits` directly. We can only get the value of `maxCredits` using the `get` keyword. This is a way to encapsulate the data and prevent it from being modified from outside the class.

On the other hand, we can set the value of `totalCredits` directly. Can you think of a way to prevent this from happening?

### Inheritance

Inheritance in Dart works similar to Python but has some differences, mainly in the syntax. The subclass is defined using the `extends` keyword followed by the superclass. Here we have a superclass `Shape` and a subclass `Circle`:
```dart
class Shape {
  double x = 0.0;
  double y = 0.0;

  Shape(this.x, this.y);

  void move(double dx, double dy) {
    x += dx;
    y += dy;
  }

  String toString() {
    return 'x: $x, y: $y';
  }
}

class Circle extends Shape {
  double radius = 0.0;

  Circle(double x, double y, double radius) : super(x, y) {
    this.radius = radius;
  }

  String toString() {
    return '${super.toString()}, radius: $radius';
  }
}
```

Pay attention to the constructor of the subclass. We need to call the superclass constructor using the `super` keyword similar to Python. Except in Dart, we need to call the superclass before the opening curly brace of the subclass constructor.

In this case we are taking three parameters `x`, `y`, and `radius` and passing the first two to the superclass constructor (using `super(x, y)`). We then assign the value of `radius` to the instance variable `radius` of the `Circle` class.

We could also write the `Circle` constructor using the shorter syntax:
```dart
  Circle(double x, double y, this.radius) : super(x, y);
```

The last thing we need to draw your attention to is that the `toString` of the `Circle` class calls the `toString` of the superclass using the `super` keyword. This way we can get the string representation of the superclass and add the radius to it. We are technically overriding the `toString` method of the superclass.

To see this, create an instance of the `Shape` class and the `Circle` class and print them in the `main` function:
```dart
void main() {
  Shape s = Shape(1.0, 2.0);
  print(s); // x: 1.0, y: 2.0

  Circle c = Circle(3.0, 4.0, 5.0);
  print(c); // x: 3.0, y: 4.0, radius: 5.0
}
```

Notice that the first print is calling the `toString` method of the `Shape` class and the second print is calling the `toString` method of the `Circle` class.

Since `Circle` is a sublcass of `Shape`, we can also call the `move` method on a `Circle` object:
```dart
  c.move(1.0, 1.0);
  print(c); // x: 4.0, y: 5.0, radius: 5.0
```

## Programming exercises

Here is an example of a programming exercise. I have not spend enough time to think about this and make it a good exercise. Can you think of better exercises?

1. Take the `Car` class provided in the lecture notes. Make the `speed` instance variable private and add getter and setter methods to access and modify the speed of the car. The valid colours for a car are red, blue, and green. 

1. Write a class representing a patient in a hospital. Each patient has an age, a name, and a list of symptoms. They also have a diagnosis which at the beginning is an empty string. The class should have a method `add_symptom` that receives a symptom and adds it to the list of symptoms. The class should also have a method `diagnose` that receives a diagnosis and sets the patient's diagnosis to the received diagnosis. There are some aspects of the class that must be kept private. Make sure that the class is well encapsulated and that the instance variables are not accessible from outside the class. Instead the user needs to use the methods provided by the class to interact with the object.