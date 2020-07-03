import 'package:Tic_Tac_toe/Players/Players.dart';
import 'package:Tic_Tac_toe/StartPage/StartPage.dart';
import 'package:Tic_Tac_toe/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    data();
    super.initState();
  }

  Future<void> data() async {
    final _auth = FirebaseAuth.instance;
    final user = await _auth.currentUser();
    var data = context.watch<Storage>();
    if (user == null) {
      await data.storeData();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StartPage()));
    } else {
      await data.readData();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Players()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Storage(),
      child: Scaffold(
          body: Center(
              child: Container(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/onchat.png")))),
    );
  }
}
