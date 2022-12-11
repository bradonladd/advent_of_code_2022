// Code written by Bradon Ladd
import 'dart:io';

void main() {
  new File('../input.txt').readAsLines().then((List<String> content) {
    var elves = [];
    var elf = [];
    for (var line in content) {
      if (line == '') {
        var total = 0;
        for (var bag in elf) {
          total = total + int.parse(bag);
        }
        elves.add(total);
        elf.clear();
      } else {
        elf.add(line);
      }
    }

    elves.sort();

    print(elves.last);
  });

}