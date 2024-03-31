// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

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

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr/services/Auth.dart';
import 'package:hr/views/Account/SignInView.dart';

class SignInController extends StatefulWidget {
  const SignInController({super.key});

  @override
  State<SignInController> createState() => _SignInControllerState();
}

class _SignInControllerState extends State<SignInController> {

  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}