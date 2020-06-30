import 'package:Tic_Tac_toe/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String _name;

Future<void> signInWithGoogle({BuildContext context}) async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  // Checking if email and name is null

  assert(user.displayName != null);
  assert(user.photoUrl != null);

  _name = user.displayName;

  // Only taking the first part of the name, i.e., First Name
  if (_name.contains(" ")) {
    _name = _name.substring(0, _name.indexOf(" "));
  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  var _storage = context.read<Storage>();
  _storage.storeData(uid: user.uid, name: user.displayName, email: user.email);
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}
