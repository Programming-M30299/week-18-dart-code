import 'lect18.dart';

void main() {
  BankAccount myAccount = BankAccount('Mani');
  print(myAccount.owner);

  myAccount.deposit(100.0);
  myAccount.withdraw(150.0); // should not withdraw

  print(myAccount.balance); // 100.0
  myAccount.balance = 200.0;
  print(myAccount.balance); // 200.0
  myAccount.balance = -50.0; // should not set
  print(myAccount.balance); // 200.0
}
