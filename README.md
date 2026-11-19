# Dart OOP Assignment: Kigali Bus Card

**Name:** Clarisse Umutoni
**Student ID:** 26703/2024

## My numbers

- D = 3, L = 3 (last 2 digits of 26703 are 03, so D = 3)
- Starting balance = 1000 + (3 × 10) = 1030 RWF
- Bus fare = 200 + 3 = 203 RWF
- Student discount = 10 + 3 = 13%

## Output of main.dart

```
Error: name too short
Owner: Clarisse | Balance: 1030 RWF
Owner: Clarisse Umutoni | Balance: 1030 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 203 RWF
Paid 203 RWF
Owner: Clarisse Umutoni | Balance: 2624 RWF
Student discount: 26 RWF
Paid 177 RWF
Owner: Clarisse Umutoni | Balance: 853 RWF
Student card: 13% off
```

## Part 1: Why no setter for balance?

If balance had a setter, anyone could write `card.balance = 1000000` and give themselves free money, or set it to any number without paying. With no setter, the balance can only change through `topUp` (which checks the 500 to 50000 rule) and `pay` (which refuses when the fare is more than the balance). This keeps the money safe and the rules enforced.

## Part 2: What does ~/ do?

`/` is normal division and gives a decimal number. `~/` is integer division: it divides and throws away the decimal part, giving a whole number (an int).

```dart
print(237 * 17 / 100);   // 40.29
print(237 * 17 ~/ 100);  // 40
```

For the bus card, money is in whole RWF, so `~/` gives a whole-number discount.

## Part 4: Bug table

| Bug | The line | Why it is wrong (my words) | My fix |
|-----|----------|----------------------------|--------|
| 1 | `String _brand;` and `int _battery;` | The fields have no starting value, and Dart does not allow a non-null String or int to be empty. | `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | The constructor does not build the parent Phone first, but Phone needs brand and battery. | Add `: super(brand, battery)` before the `{` |
| 3 | `@override void restart() {` | `@override` only works if the parent has that method, and Phone has no `restart`. | Remove `@override` |
| 4 | `p.battery = 100;` | There is a getter for battery but no setter, so it cannot be assigned. | Add `set battery(int value)` that accepts only 0 to 100 |
| 5 | `print(p.battery());` | `battery` is a getter, not a method. It gives an int, and an int cannot be called with `()`. | `print(p.battery);` |
| Not a bug | `Phone p = new Phone('Tecno', 50);` | The word `new` is old style but still allowed in Dart. It creates the object correctly. | (none) |

The fixed program prints `100`.

## Part 5

My prediction:

```
1
5
```

Why: For `Bag a`, `add()` makes items 1. Then `a.items = -5` is refused because the setter only accepts values of 0 or more, so items stays 1 and it prints 1. For `BigBag b`, `add()` runs `super.add()` twice, so each call adds 2. Two calls make 4. Then `b.items = b.items + 1` sets it to 5, which is allowed, so it prints 5.

Real output:

```
1
5
```

Was I right? Yes, my prediction was right.
