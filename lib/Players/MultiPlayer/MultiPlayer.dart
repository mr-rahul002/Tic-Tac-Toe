import 'package:Tic_Tac_toe/LoginScreen/GoogleSignIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MultiPlayer extends StatefulWidget {
  @override
  _MultiPlayerState createState() => _MultiPlayerState();
}

class _MultiPlayerState extends State<MultiPlayer> {
  bool player1 = true;
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;
  var myTextStyle = TextStyle(color: Colors.white, fontSize: 20);

  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
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
                            "PLAYER B",
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
                      _tapped(index);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.grey[700],
                          ),
                        ),
                        child: Center(
                            child: Text(displayExOh[index],
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

  void _tapped(int index) {
    setState(() {
      if (player1 && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        filledBoxes += 1;
      } else if (!player1 && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        filledBoxes += 1;
      }
      player1 = !player1;
      _chechWinner();
    });
  }

//check 1 row
  void _chechWinner() {
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showDialog(displayExOh[0]);
    }

//check 2 row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showDialog(displayExOh[3]);
    }

//check 3 row

    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showDialog(displayExOh[6]);
    }

//check 1 column

    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showDialog(displayExOh[0]);
    }

//check 2 column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showDialog(displayExOh[1]);
    }

//check 3 column

    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showDialog(displayExOh[2]);
    }

//check diagonal

    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != '') {
      _showDialog(displayExOh[2]);
    }

//check diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showDialog(displayExOh[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("WINNER IS " + winner),
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
    if (winner == 'O') {
      ohScore += 1;
    } else if (winner == 'X') {
      exScore += 1;
    }
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

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
      filledBoxes = 0;
    });
  }
}
