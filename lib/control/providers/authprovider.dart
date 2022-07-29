import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class AuthProvider with ChangeNotifier {
  var myemail, mypassword, myname;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  UserCredential? userCredential;

  register(String email, String password, String name) async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  SignIn(String email, String password) async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    print(userCredential!.user!.uid);
    print(userCredential!.user!.emailVerified);
    if (userCredential!.user!.emailVerified == false) {
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
    }
  }

  signInAnonymously() async {
    userCredential = await FirebaseAuth.instance.signInAnonymously();
    print(userCredential!.user!.uid);
  }
}