import 'dart:io';

class Stack {
  Stack();
  List<String> crates = [];
  String pop() => crates.removeLast();
  void push(String crate) => crates.add(crate);
  void printStack() => print(crates);
}

void main() {
  new File('../input.txt').readAsLines().then((List<String> instructions) {
    List<Stack> warehouse = List.generate(9, (_) => Stack(), growable: false);

    // Iterate through stacks from the bottom up and push onto the stacks
    var stackIndex = 0;
    for (var col = 1; col <= 35; col = col + 4) {
      for (var row = 7; row >= 0; row--) {
        if (instructions[row][col] != " ") {
          warehouse[stackIndex].push(instructions[row][col]);
        }
      }
      stackIndex++;
    }

    for (var line = 10; line < instructions.length; line++) {
      // Gather the operations into a list for easier processing
      String opString =
          instructions[line].replaceAll(new RegExp("( from | to )"), ",");
      opString = opString.replaceAll("move ", "");
      List<String> operations = opString.split(",");

      Stack tempStack = Stack();
      for (var move = 0; move < int.parse(operations[0]); move++) {
        tempStack.push(warehouse[int.parse(operations[1]) - 1].pop());
      }

      for (var crates = 0; crates < int.parse(operations[0]); crates++) {
        warehouse[int.parse(operations[2]) - 1].push(tempStack.pop());
      }
    }

    String stacksTop = "";

    for (var stack in warehouse) {
      stacksTop = stacksTop + stack.pop();
    }

    print(stacksTop);
  });
}

// Name: Bradon Ladd
// Date Finished: 2022-12-11