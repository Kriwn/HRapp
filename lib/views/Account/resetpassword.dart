import 'package:flutter/material.dart';
import 'package:hr/views/Account/signin.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Icon(Icons.mail),
                Text(
                  "E-Mail", 
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Charmonman", 
                    fontWeight: FontWeight.bold
                  ),
                ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(100.0, 5.0, 100.0, 0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "E-Mail",
              ),
            ),
          ),
          const SizedBox(height: 20,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Icon(Icons.lock),
                Text(
                  "Password", 
                  style: TextStyle(
                    fontSize: 16, 
                    fontFamily: "Charmonman", 
                    fontWeight: FontWeight.bold
                  ),
                ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(100.0, 5.0, 100.0, 0),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "New Password",
              ),
            ),
          ),
          const SizedBox(height: 20,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Icon(Icons.lock),
                Text(
                  "Confirm Password", 
                  style: TextStyle(
                    fontSize: 16, 
                    fontFamily: "Charmonman", 
                    fontWeight: FontWeight.bold
                  ),
                ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(100.0, 5.0, 100.0, 0),
            child: TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Confirm Your Password",
              ),
            ),
          ),
          const SizedBox(height: 50,),
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 30, 95, 116),
            child: const Text("Reset", style: TextStyle(color: Colors.white),),
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