import 'dart:async';

import 'package:Tic_Tac_toe/LoginScreen/SignIn.dart';
import 'package:Tic_Tac_toe/Players/Players.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SharedPreferences logindata;
  bool newUser;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Future<void> checkUser() async {
    logindata = await SharedPreferences.getInstance();
    newUser = (logindata.getBool('login') ?? true);
    print(newUser);
    if (newUser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Players()));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                height: 200,
                width: 200,
                child: Image.asset("assets/TicTacToe.png"))));
  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser();
    });
  }

  Future<void> navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;

    print(status);
    if (status) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Players(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignIn(),
          ));
    }
  }
}
