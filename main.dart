class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor (done for you)
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // EXAMPLE: getter for owner (done for you)
  String get owner {
    return _owner;
  }

  // TODO 1: getter for balance
  int get balance {
    return _balance;
  }

  // EXAMPLE: setter for owner, with a rule (done for you)
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  // EXAMPLE: a method (done for you)
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // TODO 2: topUp(int amount), only 500 to 50000 RWF
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // TODO 3: pay(int fare)
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}

class StudentCard extends BusCard {
  int _discount = 0;

  // Constructor (done for you)
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  // EXAMPLE: override showInfo (done for you)
  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }

  // TODO 4: override pay(int fare)
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

void main() {
  // My numbers: D = 3, L = 3
  // Starting balance = 1030 RWF, Bus fare = 203 RWF, Discount = 13%

  BusCard card = BusCard('Clarisse', 1030);
  card.owner = 'Al'; // refused: name too short
  card.showInfo();

  // TODO 5
  card.owner = 'Clarisse Umutoni';
  card.showInfo();

  // TODO 6
  card.topUp(100);
  card.topUp(2000);

  // TODO 7
  card.pay(203);
  card.pay(203);
  card.showInfo();

  // TODO 8
  StudentCard student = StudentCard('Clarisse Umutoni', 1030, 13);

  // TODO 9
  student.pay(203);
  student.showInfo();
}
