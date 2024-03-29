import 'package:flutter/material.dart';
import 'package:hr/views/components/AccountTextField.dart';
import 'package:hr/views/Account/SignInView.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 232, 223),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AccountTextField(const Icon(Icons.mail), 16, "Charmonman", FontWeight.bold, "E-Mail", "E-Mail", emailController),
          const SizedBox(height: 20,),
          AccountTextField(const Icon(Icons.person), 16, "Charmonman", FontWeight.bold, "Username", "Username", usernameController),
          const SizedBox(height: 20,),
          AccountTextField(const Icon(Icons.lock), 16, "Charmonman", FontWeight.bold, "Password", "Password", passwordController),
          const SizedBox(height: 20,),
          AccountTextField(const Icon(Icons.lock), 16, "Charmonman", FontWeight.bold, "Confirm Password", "Confirm Password", confirmPasswordController),
          const SizedBox(height: 50,),
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 30, 95, 116),
            child: const Text("Sign up", style: TextStyle(color: Colors.white),),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignIn()),
              )
            }
          ),
        ],
      ),
    );
  }
}