import 'package:Tic_Tac_toe/SPLASH.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}
