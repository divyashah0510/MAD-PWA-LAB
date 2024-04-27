// Function to Sum All Even Numbers in a List
int sumEvenNumbers(List<int> numbers) {
  int sum = 0;
  for (int num in numbers) {
    if (num % 2 == 0) {
      sum += num;
    }
  }
  return sum;
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('Sum of even numbers: ${sumEvenNumbers(numbers)}');
}
// run the code with 
// dart filename.dart


// Loop to Iterate Over a Map and Print Key-Value Pairs
// void printKeyValuePairs(Map<String, String> map) {
//   for (var entry in map.entries) {
//     print('${entry.key}: ${entry.value}');
//   }
// }

// void main() {
//   Map<String, String> capitals = {
//     'USA': 'Washington D.C.',
//     'UK': 'London',
//     'Japan': 'Tokyo'
//   };

//   printKeyValuePairs(capitals);
// }


// Function to Return a List with Only Unique Values (No Duplicates)
// List<int> uniqueValues(List<int> numbers) {
//   Set<int> uniqueSet = {};
//   for (int num : numbers) {
//     uniqueSet.add(num);
//   }
//   return uniqueSet.toList();
// }

// void main() {
//   List<int> numbers = [1, 2, 3, 2, 4, 5, 5, 6];
//   print('Unique values: ${uniqueValues(numbers)}');
// }


//  Higher-Order Function to Apply a Function to Each Element in a List
// void applyFunction<T>(List<T> items, void Function(T) func) {
//   for (T item : items) {
//     func(item);
//   }
// }

// void main() {
//   List<int> numbers = [1, 2, 3, 4, 5];

//   // Define a function to print square of a number
//   void printSquare(int number) {
//     print('Square of $number is ${number * number}');
//   }

//   applyFunction(numbers, printSquare);
// }
