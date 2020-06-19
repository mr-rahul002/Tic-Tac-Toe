import 'package:Tic_Tac_toe/HomePage.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 60, top: 20),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
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
                              'Single Player'.toUpperCase(),
                              style: myNewFont.copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  GestureDetector(
                     onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
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
                  SizedBox(height:20),
                  Container(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
