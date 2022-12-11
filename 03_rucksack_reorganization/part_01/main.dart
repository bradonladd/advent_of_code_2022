import 'dart:io';

void main() {
  int points = 0;

  new File('../input.txt').readAsLines().then((List<String> rucksacks) {
    

    for (var sack in rucksacks) {

      Set duplicateItems = new Set();
      for (var item = 0; item < (sack.length / 2).floor(); item++) {
        duplicateItems.add(sack[item]);
      }
      // print("|------- Duplicate items contains: $duplicateItems");

      for (int item = (sack.length / 2).floor();
          item < sack.length;
          item++) {
        if (duplicateItems.contains(sack[item])) {
          if (sack.codeUnitAt(item) < 97) {
            points = points + (sack.codeUnitAt(item) - 38);
          } else {
            points = points + (sack.codeUnitAt(item) - 96);
          }
          break;
        }
      }
    }
    print(points);
  });
}