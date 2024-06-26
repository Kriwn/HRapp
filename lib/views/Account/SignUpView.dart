import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hr/controllers/SignUpController.dart';
import 'package:hr/views/components/AccountTextField.dart';
import 'package:hr/controllers/PageList.dart';
import 'package:hr/services/Auth.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? errorMessage = '';
  String wrongInput = '';
  PageList pageList = PageList();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    usernameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim());
      SignUpController().addData(usernameController.text.trim(), emailController.text.trim(), "", nameController.text.trim(), "none");
    } on FirebaseException catch (e) {
      print("Cannot create account.");
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 232, 223),
      body: SingleChildScrollView( 
      child:Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => {Navigator.pop(context)},
                        icon: const Icon(Icons.arrow_back_ios)
                      ),
                    ],
                ),
              ),
              AccountTextField(const Icon(Icons.mail), 16, "WorkSans", FontWeight.bold, "E-Mail", "E-Mail", emailController),
              const SizedBox(height: 20,),
              AccountTextField(const Icon(Icons.book), 16, "WorkSans", FontWeight.bold, "Name", "Firstname Lastname", nameController),
              const SizedBox(height: 20,),
              AccountTextField(const Icon(Icons.person), 16, "WorkSans", FontWeight.bold, "Username", "Username", usernameController),
              const SizedBox(height: 20,),
              AccountTextField(const Icon(Icons.lock), 16, "WorkSans", FontWeight.bold, "Password", "Password", passwordController),
              const SizedBox(height: 20,),
              AccountTextField(const Icon(Icons.lock), 16, "WorkSans", FontWeight.bold, "Confirm Password", "Confirm Password", confirmPasswordController),
              const SizedBox(height: 20,),
              Text(
              wrongInput,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "WorkSans",
                  color: Colors.red),
              ),
              const SizedBox(height: 50,),
              FloatingActionButton.extended(
                backgroundColor: const Color.fromARGB(255, 30, 95, 116),
                label: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
                    setState(() {
                      wrongInput = "'Password' and 'Confirm Password' do not correct.";
                    });
                  } else {
                    await createUserWithEmailAndPassword();
                    pageList.routeTo(context, "SignIn");
                  }
                }
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}