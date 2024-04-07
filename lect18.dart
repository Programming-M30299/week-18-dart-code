void main() {}

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
