import 'dart:io';

void main() {
  double points = 0;

  new File('input.txt').readAsLines().then((List<String> rucksacks) {
    
    // print("ASCII Code for ${rucksacks[5][0]} is ${(rucksacks[5]).codeUnitAt(0)}");
    // print("ASCII Code for ${rucksacks[1][0]} is ${(rucksacks[1]).codeUnitAt(0)}");

    for (var sack in rucksacks) {
      // print('Evaluating sack $sack');
      Set duplicateItems = new Set();
      for (var item = 0; item < (sack.length / 2).floor(); item++) {
        duplicateItems.add(sack[item]);
      }
      // print("|------- Duplicate items contains: $duplicateItems");

      for (int item = (sack.length / 2).floor() + 1;
          item < sack.length;
          item++) {
        if (duplicateItems.contains(sack[item])) {
          points = points + ((sack.codeUnitAt(item) - 64) * 2);
        }
      }
    }

    print(points);
  });
}
