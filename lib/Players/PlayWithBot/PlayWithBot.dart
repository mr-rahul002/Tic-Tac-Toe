import 'dart:math';

import 'package:Tic_Tac_toe/LoginScreen/GoogleSignIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'DisplayExOh.dart';

class PlayWithBot extends StatefulWidget {
  @override
  _PlayWithBotState createState() => _PlayWithBotState();
}

class _PlayWithBotState extends State<PlayWithBot> {
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  var myTextStyle = TextStyle(color: Colors.white, fontSize: 20);

  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
  List<DisplayExOh> displaExOh;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    super.initState();
    displaExOh = doInit();
  }

  List<DisplayExOh> doInit() {
    player1 = new List();
    player2 = new List();
    activePlayer = 1;

    var dsplyExOhls = <DisplayExOh>[
      new DisplayExOh(id: 1),
      new DisplayExOh(id: 2),
      new DisplayExOh(id: 3),
      new DisplayExOh(id: 4),
      new DisplayExOh(id: 5),
      new DisplayExOh(id: 6),
      new DisplayExOh(id: 7),
      new DisplayExOh(id: 8),
      new DisplayExOh(id: 9),
    ];
    return dsplyExOhls;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            name,
                            style: myNewFontWhite,
                          ),
                          SizedBox(height: 20),
                          Text(exScore.toString(), style: myNewFontWhite),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "BOT",
                            style: myNewFontWhite,
                          ),
                          SizedBox(height: 20),
                          Text(ohScore.toString(), style: myNewFontWhite),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 300),
              child: Container(
                child: FloatingActionButton(
                    onPressed: _clearBoard,
                    child: Icon(Icons.replay),
                    backgroundColor: Colors.grey[700]),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      playGame(displaExOh[index]);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.grey[700],
                          ),
                        ),
                        child: Center(
                            child: Text(displaExOh[index].text,
                                style: myNewFontWhite))),
                  );
                },
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Center(
                child: Text("TIC TAC TOE", style: myNewFontWhite),
              )),
            )),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you really want to exit!"),
              actions: <Widget>[
                FlatButton(
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text("Yes "))
              ],
            ));
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("DRAW"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: Text("PLAY AGAIN"))
            ],
          );
        });
  }

  void autoPlay() {
    var emptyCells = new List();
    var list = new List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = new Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[randIndex];
    int i = displaExOh.indexWhere((p) => p.id == cellID);
    playGame(displaExOh[i]);
  }

  void playGame(DisplayExOh gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";

        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";

        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (displaExOh.every((p) => p.text != "")) {
          _showDrawDialog();
        } else {
          Future.delayed(Duration(seconds: 1), () {
            if (activePlayer == 2) autoPlay();
          });
        }
      }
    });
  }

  void _clearBoard() {
    setState(() {
      setState(() {
        displaExOh = doInit();
      });
      filledBoxes = 0;
    });
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    // row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    // row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    // col 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    // col 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    // col 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    //diagonal
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("WINNER IS X"),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        _clearBoard();
                        Navigator.of(context).pop();
                      },
                      child: Text("PLAY AGAIN")),
                ],
              );
            });
        exScore += 1;
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("WINNER IS O"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _clearBoard();
                      Navigator.of(context).pop();
                    },
                    child: Text("PLAY AGAIN"),
                  )
                ],
              );
            });
        ohScore += 1;
      }
    }
    return winner;
  }
}
