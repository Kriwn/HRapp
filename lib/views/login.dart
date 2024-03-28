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
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
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
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username",
                  ),
                ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
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
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
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