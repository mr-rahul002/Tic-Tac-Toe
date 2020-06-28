import 'package:Tic_Tac_toe/StartPage/StartPage.dart';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
