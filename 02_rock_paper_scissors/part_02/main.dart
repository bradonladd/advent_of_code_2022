import 'dart:io';

// A - Rock - 1pt
// B - Paper - 2pt
// C - Scissors - 3pt

// X - Loss
// Y - Draw
// Z - Win

// Loss - 0pt
// Draw - 3pt
// Win - 6pt

void main() {
  new File('../input.txt').readAsLines().then((List<String> games) {
    var score = 0;

    for (var game in games) {
      var gameScore = 0;
      var opponentChoice = game[0];
      var gameOutcome = game[2];
      var yourChoice;

      if (gameOutcome == 'X') {
        if (opponentChoice == 'A') {
          yourChoice = 'C';
        } else if (opponentChoice == 'B') {
          yourChoice = 'A';
        } else if (opponentChoice == 'C') {
          yourChoice = 'B';
        }
      } else if (gameOutcome == 'Y') {
        yourChoice = opponentChoice;
      } else if (gameOutcome == 'Z') {
        if (opponentChoice == 'A') {
          yourChoice = 'B';
        } else if (opponentChoice == 'B') {
          yourChoice = 'C';
        } else if (opponentChoice == 'C') {
          yourChoice = 'A';
        }
      }

      // Opponent chooses rock
      if (opponentChoice == 'A') {
        // Rock, draw, (1 + 3) = 4pt
        if (yourChoice == 'A') {
          gameScore = gameScore + 4;
          // Paper, win, (2 + 6) = 8pt
        } else if (yourChoice == 'B') {
          gameScore = gameScore + 8;
          // Scissors, lose, (3 + 0) = 3pt
        } else if (yourChoice == 'C') {
          gameScore = gameScore + 3;
        }
        // Opponent chooses Paper
      } else if (opponentChoice == 'B') {
        // Rock, loss, (1 + 0) = 1pt
        if (yourChoice == 'A') {
          gameScore = gameScore + 1;
          // Paper, draw, (2 + 3) = 5pt
        } else if (yourChoice == 'B') {
          gameScore = gameScore + 5;
          // Scissors, win, (3 + 6) = 9pt
        } else if (yourChoice == 'C') {
          gameScore = gameScore + 9;
        }
        // Opponent chooses Scissors
      } else if (opponentChoice == 'C') {
        // Rock, win, (1 + 6) = 7pt
        if (yourChoice == 'A') {
          gameScore = gameScore + 7;
          // Paper, loss, (2 + 0) = 2pt
        } else if (yourChoice == 'B') {
          gameScore = gameScore + 2;
          // Scissors, draw, (3 + 3) = 6pt
        } else if (yourChoice == 'C') {
          gameScore = gameScore + 6;
        }
      }

      score = score + gameScore;
    }

    print(score);
  });
}
