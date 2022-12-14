import 'dart:io';

void main() {
  Map<String, int> drive = {"/": 0};

  // Store all unique paths, that's the problem
  new File('../input.txt').readAsLines().then((List<String> commands) {
    List<String> paths = [];
    for (var line = 0; line < commands.length; line++) {
      var command = commands[line];
      if (command.contains("cd")) {
        var directory = command.replaceAll("\$ cd ", "");
        if (directory == "..") {
          paths.removeLast();
        } else {
          paths.add(directory);
        }
      } else if (command.contains("ls")) {
        continue;
      } else {
        print(command);
        if (!command.contains("dir")) {
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

    var toDelete = 0;
    for (var size in drive.entries) {
      if (size.value <= 100000) {
        // print("${size.key} : ${size.value}");
        toDelete = toDelete + size.value;
      }
    }

    print(toDelete);
  });
}

// Name: Bradon Ladd
// Date Finished: 2022-12-13
// Thanks to https://github.com/hyper-neutrino/ and Wren Cornell for providing clue
//    to the solution
