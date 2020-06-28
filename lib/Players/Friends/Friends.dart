import 'package:Tic_Tac_toe/LoginScreen/GoogleSignIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  get displayExOh => null;

  @override
  void initState() {
    setup();
    super.initState();
  }

  bool player1 = true;

  List<int> moves = <int>[];
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
                    onPressed: setup(),
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
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.grey[700],
                          ),
                        ),
                        child: Center(child: Text(""))),
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
    });
  }

  setup() {
    Firestore.instance
        .collection("MULTI")
        .document("1")
        .snapshots()
        .listen((event) {
      if (moves.isEmpty) {
        moves = event.data['MOVE'];
      } else {
        if (moves.length != (event.data['MOVE'] as List<int>).length) {
          _tapped((event.data['MOVE']
              as List<int>)[(event.data['MOVE'] as List<int>).length - 1]);
        }
      }
    });
  }
}
