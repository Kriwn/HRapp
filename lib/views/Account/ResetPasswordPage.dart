import 'package:flutter/material.dart';
import 'package:hr/controllers/ResetPasswordController.dart';
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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 232, 223),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => {Navigator.pop(context)},
                      icon: const Icon(Icons.arrow_back_ios)
                    ),
                  ],
                ),
                const SizedBox(height: 100,),
                const Text(
                  textAlign: TextAlign.center,
                  "Check your email after enter the information below.",
                   style: TextStyle(fontSize: 32, fontFamily: "WorkSans"),
                ),
                const SizedBox(height: 100,),
                AccountTextField(const Icon(Icons.mail), 16, "WorkSans",
                    FontWeight.bold, "E-Mail", "E-Mail", emailController),
                const SizedBox(
                  height: 20,
                ),
                FloatingActionButton.extended(
                    backgroundColor: const Color.fromARGB(255, 30, 95, 116),
                    label: const Text(
                      "Reset",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                      Reset().PasswordReset(context, emailController.text.trim()),
                      pageList.routeTo(context, "SignIn"),
                    }
                ),
              ],
            ),
          ),
        ));
  }
}
