void main() {}

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
