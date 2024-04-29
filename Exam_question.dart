import 'dart:io';

void main() {
  print("Enter the numbers separated by spaces:");
  String input = stdin.readLineSync()!;
  List<int> numbers = input.split(' ').map((e) => int.parse(e)).toList();
  
  print("Choose the basis:\n"
        "1. Total\n"
        "2. Highest\n"
        "3. Lowest\n"
        "4. Average\n"
        "5. Median");

  int basis = int.parse(stdin.readLineSync()!);

  switch (basis) {
    case 1:
      printTotal(numbers);
      break;
    case 2:
      printHighest(numbers);
      break;
    case 3:
      printLowest(numbers);
      break;
    case 4:
      printAverage(numbers);
      break;
    case 5:
      printMedian(numbers);
      break;
    default:
      print('Invalid basis');
  }
}

void printTotal(List<int> numbers) {
  int total = numbers.reduce((value, element) => value + element);
  print('Total: $total');
}

void printHighest(List<int> numbers) {
  int highest =
      numbers.reduce((value, element) => value > element ? value : element);
  print('Highest: $highest');
}

void printLowest(List<int> numbers) {
  int lowest =
      numbers.reduce((value, element) => value < element ? value : element);
  print('Lowest: $lowest');
}

void printAverage(List<int> numbers) {
  double average =
      numbers.reduce((value, element) => value + element) / numbers.length;
  print('Average: $average');
}

void printMedian(List<int> numbers) {
  numbers.sort();
  double median;
  if (numbers.length % 2 == 0) {
    median = (numbers[numbers.length ~/ 2 - 1] + numbers[numbers.length ~/ 2]) / 2;
  } else {
    median = numbers[numbers.length ~/ 2].toDouble();
  }
  print('Median: $median');
}