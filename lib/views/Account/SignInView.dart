import 'package:flutter/material.dart';
import 'package:hr/views/Account/ResetPasswordPage.dart';
import 'package:hr/views/SettingsView.dart';
import 'package:hr/views/User/UserHomeView.dart';
import 'package:hr/views/components/AccountTextField.dart';
import '../HR/HomepageView.dart';
import 'package:hr/views/Account/SignUpView.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 232, 223),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AccountTextField(const Icon(Icons.person), 16, "Charmonman", FontWeight.bold, "Username", "Username", usernameController),
          const SizedBox(height: 20,),
          AccountTextField(const Icon(Icons.lock), 16, "Charmonman", FontWeight.bold, "Password", "Password", passwordController),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton( //Sign up button
                backgroundColor: const Color.fromARGB(255, 30, 95, 116),
                child: const Text("Sign up", style: TextStyle(color: Colors.white),),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  )
                }
              ),
              const SizedBox(width: 50,),
              // Need to add If-Else statement (User or HR)
              FloatingActionButton( //Sign in button
                backgroundColor: const Color.fromARGB(255, 30, 95, 116),
                child: const Text("Sign in", style: TextStyle(color: Colors.white),),
                onPressed: () => {
                  Navigator.push(
                    context,
                    // MaterialPageRoute(builder: (context) => const HrHomepage()),
                    // MaterialPageRoute(builder: (context) => const Settings()),
                    MaterialPageRoute(builder: (context) => const UserHomePage()),
                  )
                }
              ),
            ],
          ),
          const SizedBox(height: 30,),
          TextButton(
            onPressed: () => {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const ResetPassword()),
              )
            }, 
            child: const Text("Can’t remember password ?\n          Reset password.", style: TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontSize: 16),)
          )
        ],
      ),
    );
  }
}