void main() {
  Student myStudent = Student('John Doe', 4, '0123456789');
  print(myStudent.name); // John Doe
  print(myStudent.level); // 4
  print(myStudent.phoneNumber); // Phone number ending in 6789

  myStudent.phoneNumber = '9876543210';
  print(myStudent.phoneNumber); // Phone number ending in 3210
}

class Student {
  String? name;
  int level = 4;
  String? _phoneNumber;

  Student(String name, int level, String phoneNumber) {
    this.name = name;
    this.level = level;
    this._phoneNumber = phoneNumber;
  }

  // void set phoneNumber(String phoneNumber) {
  //   this._phoneNumber = phoneNumber;
  // }

  void set phoneNumber(String phoneNumber) {
    this._phoneNumber = phoneNumber;
  }

  String get phoneNumber {
    return 'Phone number ending in ${_phoneNumber!.substring(7)}';
  }

  String greet() => 'Hello, $name!';
}
