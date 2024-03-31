import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr/services/Auth.dart';
import 'package:hr/views/Account/SignInView.dart';

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


// class SignInController extends StatefulWidget {
//   const SignInController({super.key});

//   @override
//   State<SignInController> createState() => _SignInControllerState();
// }

// class _SignInControllerState extends State<SignInController> {

//   @override
//   Widget build(BuildContext context) {
//     return SignIn();
//   }
// }



class CheckLogin{

  final String  _emailController;
  final String  _passwordController;
  late String message;


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

  // bool Check (){
  //   signInWithEmailPassword();

  //   if ()
  // }
}