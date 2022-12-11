

import 'dart:io';

void main() {
  int points = 0;

  new File('../input.txt').readAsLines().then((List<String> rucksacks) {
    
    for (int group = 0; group < rucksacks.length; group = group + 3) {
      Set<String> firstElf = new Set();
      Set<String> secondElf = new Set();
      Set<String> thirdElf = new Set();

      String firstSack = rucksacks[group];
      String secondSack = rucksacks[group + 1];
      String thirdSack = rucksacks[group + 2];

      for (var item = 0; item < firstSack.length; item++) {
        firstElf.add(firstSack[item]);
      }
      for (var item = 0; item < secondSack.length; item++) {
        secondElf.add(secondSack[item]);
      }
      for (var item = 0; item < thirdSack.length; item++) {
        thirdElf.add(thirdSack[item]);
      }

      for (var item in firstElf) {
        if (secondElf.contains(item) && thirdElf.contains(item)) {
          if (item.codeUnitAt(0) < 97) {
            points = points + (item.codeUnitAt(0) - 38);
          } else {
            points = points + (item.codeUnitAt(0) - 96);
          }
        }
      }
    }

    print(points);
  });
}
