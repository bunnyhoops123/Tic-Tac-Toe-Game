import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List displayXO = [for (int i = 0; i < 9; i++) ''];
  bool oTurn = true;
  int oScore = 0;
  int xScore = 0;
  int fillBoxes = 0;

  TextStyle textFont = GoogleFonts.pressStart2p(
      fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(children: [
        Expanded(
            child: Container(
                child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Player X',
                  style: textFont,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  xScore.toString(),
                  style: textFont,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Player O',
                  style: textFont,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  oScore.toString(),
                  style: textFont,
                )
              ],
            )
          ],
        ))),
        Expanded(
          flex: 3,
          child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: ((context, index) => GestureDetector(
                    onTap: (() {
                      _tapped(index);
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey[600]!)),
                      child: Center(
                          child: Text(
                        displayXO[index],
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  ))),
        ),
        Expanded(
            child: Container(
          child: Center(
              child: Column(
            children: [
              Text(
                'Tic Tac Toe',
                style: textFont,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '@BunnyHoops',
                style: textFont,
              )
            ],
          )),
        ))
      ]),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        oTurn = !oTurn;
        fillBoxes++;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        oTurn = !oTurn;
        fillBoxes++;
      }
      _checkWinner();
    });
  }

  void _checkWinner() {
    //Check Rows
    if (displayXO[0] == displayXO[1] &&
        displayXO[1] == displayXO[2] &&
        displayXO[0] != '') {
      _showWinDialog();
      print('1');
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[4] == displayXO[5] &&
        displayXO[3] != '') {
      _showWinDialog();
      print('2');
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _showWinDialog();
      print('3');
    }
    //Check Columns
    if (displayXO[0] == displayXO[3] &&
        displayXO[3] == displayXO[6] &&
        displayXO[0] != '') {
      _showWinDialog();
      print('4');
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _showWinDialog();
      print('5');
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[8] == displayXO[2] &&
        displayXO[2] != '') {
      _showWinDialog();
      print('6');
    }
    //Diagonals
    if (displayXO[0] == displayXO[4] &&
        displayXO[4] == displayXO[8] &&
        displayXO[0] != '') {
      _showWinDialog();
      print('7');
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[6] == displayXO[4] &&
        displayXO[2] != '') {
      _showWinDialog();
      print('8');
    } else if (fillBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[400],
              title: Text('Draw!'),
              content: Text('Oops'),
              actions: [
                TextButton(
                    onPressed: () {
                      _clearBoard();
                    },
                    child: const Text(
                      'Play Again',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ));
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      Navigator.pop(context);
    });
    fillBoxes = 0;
  }

  void _showWinDialog() {
    if (!oTurn) {
      oScore++;
    } else {
      xScore++;
    }
    fillBoxes = 0;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[400],
              title: Text('Winner!'),
              content: Text((!oTurn) ? 'O Won' : 'X won'),
              actions: [
                TextButton(
                    onPressed: () {
                      _clearBoard();
                    },
                    child: const Text(
                      'Play Again',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ));
  }
}
