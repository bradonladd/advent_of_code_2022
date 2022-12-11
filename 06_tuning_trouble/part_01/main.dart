import 'dart:io';

void main() {
  new File('../input.txt').readAsString().then((String data) {
    int markerStart = 0;
    int markerEnd = 3;

    while (markerEnd < data.length) {
      Set packet = Set();
      bool unique = false;
      for (var i = markerStart; i <= markerEnd; i++) {
        if (i == markerEnd && !packet.contains(data[i])) {
          unique = true;
        }
        if (packet.contains(data[i])) {
          break;
        } else {
          packet.add(data[i]);
        }
      }

      if (unique) {
        break;
      }

      markerStart = markerStart + 1;
      markerEnd = markerEnd + 1;
    }

    print(markerEnd + 1);
  });
}

// Name: Bradon Ladd
// Date Finished: 2022-12-11