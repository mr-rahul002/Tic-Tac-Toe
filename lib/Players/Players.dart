import 'package:Tic_Tac_toe/LoginScreen/GoogleSignIn.dart';
import 'package:Tic_Tac_toe/Players/Friends/Friends.dart';
import 'package:Tic_Tac_toe/Players/MultiPlayer/MultiPlayer.dart';
import 'package:Tic_Tac_toe/Players/PlayWithBot/PlayWithBot.dart';
import 'package:Tic_Tac_toe/StartPage/StartPage.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Players extends StatefulWidget {
  @override
  _PlayersState createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  var myNewFontWhite = GoogleFonts.mcLaren(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
  var myNewFont = GoogleFonts.lato(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          Container(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    imageUrl,
                  ),
                  radius: 25,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 77,
                ),
                RaisedButton(
                  onPressed: () {
                    signOutGoogle();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return StartPage();
                    }), ModalRoute.withName('/'));
                  },
                  color: Colors.grey[900],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                )
              ],
            ),
          )),
          Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 180),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlayWithBot()),
                                );
                              },
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 80,
                                    right: 80,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      padding: EdgeInsets.all(25),
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          'play with bot'.toUpperCase(),
                                          style: myNewFont.copyWith(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MultiPlayer()),
                                );
                              },
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 80,
                                    right: 80,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      padding: EdgeInsets.all(25),
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          'multi Player'.toUpperCase(),
                                          style: myNewFont.copyWith(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Friends()),
                                );
                              },
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 80,
                                    right: 80,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      padding: EdgeInsets.all(25),
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          'play with friend'.toUpperCase(),
                                          style: myNewFont.copyWith(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 20),
            child: Row(
              children: <Widget>[
                Container(
                  child: AvatarGlow(
                    endRadius: 30,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.white,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 1),
                    startDelay: Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.none,
                          ),
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[900],
                        child: Container(
                          child: Image.asset(
                            'assets/tictactoelogo.png',
                            color: Colors.white,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        radius: 25.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    child: Text(
                      "TIC TAC TOE",
                      style: myNewFontWhite.copyWith(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
