import 'package:hr/services/UserDB.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr/services/Auth.dart';
import 'package:hr/views/Account/SignInView.dart';
import 'package:hr/main.dart';

// final listener = InternetConnection().onStatusChange.listen((InternetStatus status) {
//   switch (status) {
//     case InternetStatus.connected:
//       index = 0;
//       break;
//     case InternetStatus.disconnected:
//       index = 1;
//       break;
//   }
// });

class CheckLogin{

  final UserDB userDB = UserDB();

  final String  _emailController;
  final String  _passwordController;
  late String message;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instanceFor(app: app);

  CheckLogin(this._emailController,this._passwordController,this.message);


  Future<void> signInWithEmailPassword() async{
    try {
      await Auth().signInWithEmailAndPassword(email: _emailController, password: _passwordController);
    }on FirebaseAuthException catch (e) {
      print("not found");
      message = e.message!;
    }
  }

  // need To finish UserDB.dart 1st // 
  void Check (){
    signInWithEmailPassword();

    // Error to get Department
    print(" asdsadasdasdsadassadddddddddddd ${userDB.getDepartment(Auth().currentUser!.uid)}");
    // if (userDB.getDepartment(Auth().currentUser!.uid) == "HR")
    // {
    //   return true;
    // }
    // else{
    //   return false;
    // }
  }
  
}