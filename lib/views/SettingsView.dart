import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hr/models/user.dart';
import 'package:hr/services/Auth.dart';
import 'package:hr/services/UserDB.dart';
import 'package:hr/views/components/IconPicture.dart';
import 'package:hr/views/components/RowTextField.dart';

// Overflow keyboard //

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  UserDB userDB = UserDB();
  late User user;
  TextEditingController phoneNoController = TextEditingController();
  String phoneNo = "";

  @override
  Widget build(BuildContext context) {
    userDB.getUser(Auth().currentUser!.uid).then((value) => {
      user = value!
    });
    double screenHeight = MediaQuery.of(context).size.height;
    if(phoneNo == "") {
      userDB.getPhoneNo(Auth().currentUser!.uid).then((value) => {
       phoneNo = value ?? "",
       phoneNoController.text = phoneNo
      });
    }

    @override
    void dispose() {
      phoneNoController.dispose();
      super.dispose();
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 197, 186),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => {Navigator.pop(context)},
                      icon: const Icon(Icons.arrow_back_ios))
                ],
              ),
              const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 240, 240, 240),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 4,
                                blurRadius: 5,
                                offset: const Offset(0, 1.75))
                          ]),
                      height: 0.7 * screenHeight,
                      child: Column(
                        children: [
                          // try change iconPicture to circleAvatar(+glowAnimate ) and clickable(to change image- use imagePicker)
                          
                          // CircleAvatar(
                          //   child: button,
                          // )
                          IconPicture(200, 'assets/images/bigprk.png', "S"),
                          const SizedBox(
                            height: 40,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RowTextField(16, "K2D", FontWeight.bold, "Phone no.",
                              "Phone no.", phoneNoController),
                          const SizedBox(
                            height: 20,
                          ),
                          FloatingActionButton.extended(
                            label: const Text("Update"),
                            onPressed: () {
                              user.setPhoneNo(phoneNoController.text);
                              userDB.updateUser(Auth().currentUser!.uid, user);
                            }
                          )
                        ],
                      )))
            ],
          ),
        ));
  }
}
