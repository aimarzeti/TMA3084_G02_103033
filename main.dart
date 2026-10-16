// Zeti Nur Aimar Binti Alli
// 103033

import 'dart:io';

void main() {
  print('========================================');
  print('     WELCOME TO PIZZA ORDER SYSTEM      ');
  print('========================================');
  print('Menu & Prices:');
  print('1. Small  (S) - RM 5');
  print('2. Medium (M) - RM 7');
  print('3. Large  (L) - RM 10');
  print('========================================\n');

  bool keepOrdering = true;

  while (keepOrdering) {
    String? sizeInput;
    int pricePerPizza = 0;
    bool validSize = false;

    // Loop for valid size selection
    while (!validSize) {
      stdout.write('Enter pizza size (S / M / L) or "Q" to quit: ');
      sizeInput = stdin.readLineSync()?.trim().toUpperCase();

      if (sizeInput == 'Q') {
        print('\nThank you for visiting! Goodbye.');
        return;
      }

      // Switch statement to evaluate pizza size and pricing
      switch (sizeInput) {
        case 'S':
        case 'SMALL':
          pricePerPizza = 5;
          validSize = true;
          break;
        case 'M':
        case 'MEDIUM':
          pricePerPizza = 7;
          validSize = true;
          break;
        case 'L':
        case 'LARGE':
          pricePerPizza = 10;
          validSize = true;
          break;
        default:
          print('Invalid size selection. Please enter S, M, or L.\n');
      }
    }

    int quantity = 0;
    bool validQuantity = false;

    // Loop for valid quantity selection
    while (!validQuantity) {
      stdout.write('Enter quantity: ');
      String? qtyInput = stdin.readLineSync();
      int? parsedQty = int.tryParse(qtyInput ?? '');

      if (parsedQty != null && parsedQty > 0) {
        quantity = parsedQty;
        validQuantity = true;
      } else {
        print('Invalid quantity. Please enter a positive integer.\n');
      }
    }

    // Calculate total cost
    int totalCost = pricePerPizza * quantity;

    print('----------------------------------------');
    print('ORDER SUMMARY:');
    print('Size: $sizeInput | Quantity: $quantity');
    print('Total Amount Due: RM $totalCost');
    print('----------------------------------------\n');

    // Ask to continue
    stdout.write('Would you like to place another order? (Y/N): ');
    String? continueChoice = stdin.readLineSync()?.trim().toUpperCase();
    if (continueChoice != 'Y') {
      keepOrdering = false;
      print('\nThank you for your order! Have a great day.');
    } else {
      print('\n');
    }
  }
}