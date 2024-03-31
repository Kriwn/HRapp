import 'package:flutter/material.dart';
import 'package:hr/views/components/AccountButton.dart';
import 'package:hr/views/components/AccountTextField.dart';
import 'package:hr/controllers/PageList.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  PageList pageList = PageList();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 232, 223),
      body:SingleChildScrollView( 
      child:Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Image.asset('assets/images/bigBig.png', fit: BoxFit.cover,),
              ),
              AccountTextField(const Icon(Icons.person), 16, "WorkSans", FontWeight.bold, "Username", "Username", usernameController),
              const SizedBox(height: 20,),
              AccountTextField(const Icon(Icons.lock), 16, "WorkSans", FontWeight.bold, "Password", "Password", passwordController),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AccountButton("SignUp", Colors.white, "Sign up", const Color.fromARGB(255, 30, 95, 116)),
                  const SizedBox(width: 50,),
                  // Need to add If-Else statement (User or HR)
                  AccountButton("SignIn", Colors.white, "Sign in", const Color.fromARGB(255, 30, 95, 116)),
                ],
              ),
              const SizedBox(height: 30,),
              TextButton(
                onPressed: () => {
                pageList.routeTo(context, "ResetPassword")
                }, 
                child: const Text("Can’t remember password ?\n          Reset password.", style: TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontSize: 16),)
              )
            ],
          ),
        ),
      ),
    );
  }
}