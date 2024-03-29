import 'package:flutter/material.dart';
import 'package:hr/views/signup.dart';

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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Icon(Icons.person),
                Text(
                  "Username", 
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Charmonman", 
                    fontWeight: FontWeight.bold
                  ),
                ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
            child: TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Username",
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
            padding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
              ),
            ),
          ),
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton( //Sign up button
                child: const Text("Sign up"),
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
                child: const Text("Sign in"),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HrHomepage()),
                  )
                }
              ),
            ],
          )
        ],
      ),
    );
  }
}