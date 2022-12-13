import 'dart:io';
import 'dart:convert';


void main() {
  Map<String, int> drive = {"/": 0};

  // Store all unique paths, that's the problem
  new File('../input.txt').readAsLines().then((List<String> commands) {
    List<String> paths = [];
    for (var line = 0; line < commands.length; line++) {
      var command = commands[line];
      if (command.contains("cd") && !command.contains("..")) {
        var directory = command.replaceAll("\$ cd ", "");
        if (directory == "..") {
          paths.removeLast();
        } else {
          paths.add(directory);
        }
      } else if (command.contains("ls")) {
        // Iterate over the directory until the next command is hits
        for (var entry = line+1; entry < commands.length; entry++) {
          if (commands[entry].contains("\$")) {
            line = entry - 1;
            break;
          }

          if (commands[entry].contains("dir")) {
            var dir = commands[entry].replaceAll("dir ", "");
            drive["${paths.join("-")}-$dir"] = 0;

          } else {
            var fileSize = commands[entry].replaceAll(new RegExp("[^0-9]"), "");
            drive["/"] = drive["/"]! + int.parse(fileSize);
            for (var i = 1; i < paths.length; i++) {
              for (var j = 0; j <= i; j++) {
                drive[paths.join('-')] = drive[paths.join('-')] ?? 0 + int.parse(fileSize);
              }

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
