import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hr/models/user.dart';
import 'package:hr/services/Auth.dart';
import 'package:hr/services/UserDB.dart';
import 'package:hr/views/components/RowTextField.dart';
import 'package:avatar_glow/avatar_glow.dart';

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
  String name = "";
  String url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_bsppqvO4psg9azdZhSloO4mioLo-z5yl_IJO1In9Uw&s";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if(url == "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_bsppqvO4psg9azdZhSloO4mioLo-z5yl_IJO1In9Uw&s"){
    UserDB().getAll(Auth().currentUser!.uid).then((value) => 
    setState(() {
      url = value?.getUrlImage() ?? "";
    })
  
    ,);
    };

    userDB.getUser(Auth().currentUser!.uid).then((value) => {
      user = value!,
    });

    if(name == "") {
      userDB.getUserName(Auth().currentUser!.uid).then((value) => {
       name = value ?? "",
      });
    }
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
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => {Navigator.pop(context)},
                        icon: const Icon(Icons.arrow_back_ios))
                  ],
                ),
              ),
              const Text("Settings", style: TextStyle(fontSize: 20, fontFamily: "K2D", fontWeight: FontWeight.bold),),
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
                          const SizedBox(height: 50,),
                          Text(name, style: const TextStyle(fontSize: 16, fontFamily: "K2D", fontWeight: FontWeight.bold),),
                          const SizedBox(height: 20,),
                          // try change iconPicture to circleAvatar(+glowAnimate ) and clickable(to change image - use imagePicker)
                          AvatarGlow(
                            startDelay: const Duration(milliseconds: 1000),
                            glowColor: const Color.fromARGB(255, 245, 187, 170),
                            glowShape: BoxShape.circle,
                            // animate: _animate,
                            curve: Curves.bounceInOut,
                            child: Material(
                              elevation: 16.0,
                              shape: const CircleBorder(),
                              color: Colors.transparent,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(url),
                                backgroundColor: Colors.transparent,
                                radius: 100.0,
                              ),
                            ),
                          ),
                          // CircleAvatar(
                          //   child: button,
                          // )
                          // IconPicture(200, 'assets/images/bigprk.png', "S"),
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
