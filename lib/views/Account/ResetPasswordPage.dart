import 'package:flutter/material.dart';
import 'package:hr/views/components/AccountButton.dart';
import 'package:hr/views/components/AccountTextField.dart';
import 'package:hr/controllers/PageList.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  PageList pageList = PageList();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 232, 223),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AccountTextField(const Icon(Icons.mail), 16, "WorkSans",
                    FontWeight.bold, "E-Mail", "E-Mail", emailController),
                const SizedBox(
                  height: 20,
                ),
                AccountTextField(const Icon(Icons.lock), 16, "WorkSans",
                    FontWeight.bold, "Password", "Password", passwordController),
                const SizedBox(
                  height: 20,
                ),
                AccountTextField(
                    const Icon(Icons.lock),
                    16,
                    "WorkSans",
                    FontWeight.bold,
                    "Confirm Password",
                    "Confirm Password",
                    confirmPasswordController),
                const SizedBox(
                  height: 50,
                ),
                AccountButton("SignIn", Colors.white, "Reset",
                    const Color.fromARGB(255, 30, 95, 116)),
              ],
            ),
          ),
        ));
  }
}
