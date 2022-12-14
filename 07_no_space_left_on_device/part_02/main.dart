import 'dart:io';

void main() {
  Map<String, int> drive = {};

  // Store all unique paths, that's the problem
  new File('../input.txt').readAsLines().then((List<String> commands) {
    List<String> paths = [];
    for (var line = 0; line < commands.length; line++) {
      var command = commands[line];
      if (command[2] == "c" && command[3] == "d") {
        var directory = command.replaceAll("\$ cd ", "");
        if (directory == "..") {
          paths.removeLast();
        } else {
          paths.add(directory);
        }
      } else if (command[2] == "l" && command[3] == "s") {
        continue;
      } else {
        if (!command.startsWith("dir")) {
          var fileSize = command.replaceAll(new RegExp("[^0-9]"), "");
          List<String> tempPath = [];

          for (var i = 0; i < paths.length; i++) {
            tempPath.add(paths[i]);
            String path = tempPath.join("-");
            if (!drive.keys.contains(path)) {
              drive[path] = int.parse(fileSize);
            } else {
              drive[path] = drive[path]! + int.parse(fileSize);
            }
          }
        }
      }
    }

    var sizeToFree = 30000000 - (70000000 - drive["/"]!);
    
    List<int> files = [];
    for (var dir in drive.entries) {
      if (dir.value >= sizeToFree) {
        files.add(dir.value);
      }
    }

    files.sort((a, b) => b.compareTo(a));
    print(files.last);
  });
}

// Name: Bradon Ladd
// Date Finished: 2022-12-13

