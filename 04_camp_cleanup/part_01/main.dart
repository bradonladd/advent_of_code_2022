

import 'dart:io';

void main() {

  new File('../input.txt').readAsLines().then((List<String> sectionList) {
    int counter = 0;

    for (var sections in sectionList) {
      List<String> sectionNums = sections.split(new RegExp("[-,]"));

      if (int.parse(sectionNums[0]) <= int.parse(sectionNums[2]) && int.parse(sectionNums[1]) >= int.parse(sectionNums[3])) {
        counter++;
      } else if (int.parse(sectionNums[0]) >= int.parse(sectionNums[2]) && int.parse(sectionNums[1]) <= int.parse(sectionNums[3])) {
        counter++;
      }
    }

    print(counter);
  });
}
