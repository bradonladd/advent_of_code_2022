

import 'dart:io';

void main() {

  new File('../input.txt').readAsLines().then((List<String> sectionList) {
    int counter = 0;

    for (var sections in sectionList) {
      List<String> sectionSplits = sections.split(new RegExp("[-,]"));
      List<int> sectionNums = [int.parse(sectionSplits[0]), int.parse(sectionSplits[1]), int.parse(sectionSplits[2]), int.parse(sectionSplits[3])];

      // If any section start/end is contained within the range of the other section range, the ranges overlap
      if (sectionNums[0] >= sectionNums[2] && sectionNums[0] <= sectionNums[3]) { counter++; }
      else if (sectionNums[1] >= sectionNums[2] && sectionNums[1] <= sectionNums[3]) { counter++; }
      else if (sectionNums[2] >= sectionNums[0] && sectionNums[2] <= sectionNums[1]) { counter++; }
      else if (sectionNums[3] >= sectionNums[0] && sectionNums[3] <= sectionNums[1]) { counter++; }
    }

    print(counter);
  });
}
