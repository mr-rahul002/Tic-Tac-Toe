import "package:flutter/material.dart";


import 'StartPage.dart';


void main() => runApp(TicTacToe());

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:StartPage(),
    );
  }
}
