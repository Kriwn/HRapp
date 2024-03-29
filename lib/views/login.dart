import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                const Icon(Icons.person),
                const Text(
                  "Username", 
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Charmonman", 
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username",
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                const Icon(Icons.lock),
                const Text(
                  "Password", 
                  style: TextStyle(
                    fontSize: 16, 
                    fontFamily: "Charmonman", 
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}