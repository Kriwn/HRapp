import 'package:flutter/material.dart';
import 'package:hr/views/components/AccountTextField.dart';
import 'package:hr/controllers/PageList.dart';
import 'package:hr/controllers/SignInController.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String Path = "UserHome";

  // Make Error message // 

  String message = "";
  PageList pageList = PageList();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 232, 223),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Image.asset(
                  'assets/images/bigBig.png',
                  fit: BoxFit.cover,
                ),
              ),
              AccountTextField(const Icon(Icons.person), 16, "WorkSans",
                  FontWeight.bold, "Email", "Email", emailController),
              const SizedBox(
                height: 20,
              ),
              AccountTextField(const Icon(Icons.lock), 16, "WorkSans",
                  FontWeight.bold, "Password", "Password", passwordController),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton.extended(
                      backgroundColor: Color.fromARGB(255, 30, 95, 116),
                      label: const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => {pageList.routeTo(context, "SignUp")}),
                  const SizedBox(
                    width: 50,
                  ),
                  FloatingActionButton.extended(
                      backgroundColor: Color.fromARGB(255, 30, 95, 116),
                      label: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => {

                        CheckLogin(emailController.text,passwordController.text,message).Check()
                        // if (CheckLogin(emailController.text,passwordController.text,message).Check())
                        // {
                        //   Path = "HrHome"
                        // }
                        // else
                        // {
                        //   Path = "UserHome"
                        // },
                        // if to change Path
                        // pageList.routeTo(context, Path),                       
                        }
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () => {pageList.routeTo(context, "ResetPassword")},
                  child: const Text(
                    "Can’t remember password ?\n          Reset password.",
                    style: TextStyle(
                        color: Color.fromARGB(255, 136, 136, 136),
                        fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
