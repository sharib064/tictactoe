import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checkO = true;
  int filledBoxes = 0;
  List<String> displayXO = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  void _tapped(int index) {
    setState(() {
      if (checkO && displayXO[index] == "") {
        displayXO[index] = "O";
        filledBoxes += 1;
      } else if (!checkO && displayXO[index] == "") {
        displayXO[index] = "X";
        filledBoxes += 1;
      }

      checkO = !checkO;
      checkWinner();
    });
  }

  void checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != "") {
      showWinner(displayXO[0]);
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != "") {
      showWinner(displayXO[3]);
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != "") {
      showWinner(displayXO[6]);
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != "") {
      showWinner(displayXO[0]);
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != "") {
      showWinner(displayXO[1]);
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != "") {
      showWinner(displayXO[2]);
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != "") {
      showWinner(displayXO[0]);
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != "") {
      showWinner(displayXO[2]);
    } else if (filledBoxes == 9) {
      showDrawDialog();
    }
  }

  var newFont = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.white, letterSpacing: 3),
    fontSize: 15,
  );
  void showDrawDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[700],
        title: Text(
          'Match Draw',
          style: newFont.copyWith(fontSize: 10),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              setState(
                () {
                  displayXO = [
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                  ];
                  Navigator.pop(context);
                  filledBoxes = 0;
                  checkO = true;
                },
              );
            },
            child: Text(
              "Play again",
              style: newFont.copyWith(fontSize: 10),
            ),
          )
        ],
      ),
    );
  }

  int scoreX = 0;
  int scoreO = 0;
  void showWinner(String player) {
    player == 'X' ? scoreX++ : scoreO++;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[700],
        title: Text(
          'Player $player wins',
          style: newFont.copyWith(fontSize: 10),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              setState(
                () {
                  displayXO = [
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                  ];
                  Navigator.pop(context);

                  checkO = true;
                  filledBoxes = 0;
                },
              );
            },
            child: Text(
              "Play again",
              style: newFont.copyWith(fontSize: 10),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Player O",
                    style: newFont,
                  ),
                  Text(
                    scoreO.toString(),
                    style: newFont,
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Player X",
                    style: newFont,
                  ),
                  Text(
                    scoreX.toString(),
                    style: newFont,
                  ),
                ],
              ),
            ],
          )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _tapped(index),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade700)),
                      child: Center(
                        child: Text(
                          displayXO[index].toString(),
                          style: const TextStyle(
                              fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Text(
              "TIC TAC TOE",
              style: newFont,
            ),
          ),
        ],
      ),
    );
  }
}
