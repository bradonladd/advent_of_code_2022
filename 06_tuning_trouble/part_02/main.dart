import 'dart:io';

void main() {
  new File('../input.txt').readAsString().then((String data) {
    int markerStart = 0;
    int markerEnd = 3;

    // Sliding glass window problem, check to see if the four characters are unique
    // and if so, break and print
    var startOfPacket = evaluateData(data, markerStart, markerEnd);

    markerStart = startOfPacket + 1;
    markerEnd = startOfPacket + 14;

    var startOfMessage = evaluateData(data, markerStart, markerEnd);
    print(startOfMessage);
  });
}

int evaluateData(String data, int start, int end) {
  while (end < data.length) {
    Set packet = Set();
    bool unique = false;
    for (var i = start; i <= end; i++) {
      if (i == end && !packet.contains(data[i])) {
        unique = true;
      }
      if (packet.contains(data[i])) {
        break;
      } else {
        packet.add(data[i]);
      }
    }

    if (unique) {
      return end;
    }

    start = start + 1;
    end = end + 1;
  }

  return -1;
}

// Name: Bradon Ladd
// Date Finished: 2022-12-11