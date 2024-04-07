void main() {}

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
