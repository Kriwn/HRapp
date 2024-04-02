import 'package:flutter/material.dart';
import 'package:hr/models/user.dart';
import 'package:hr/services/UserDB.dart';

class StatusUser extends StatefulWidget {
  final dynamic data;

  StatusUser({required this.data});

  @override
  _StatusUser createState() => _StatusUser(data: data);
  
}

class _StatusUser extends State<StatusUser> {
  // Future<List<String>>? _UsernameList;
  
  final dynamic data;
  
  _StatusUser({required this.data});

  @override
  void initState(){
    super.initState();
    // _UsernameList = DepartmentController().getNameByDepartment(data);
  }
  

@override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 197, 186),
      body: StreamBuilder(
        stream: UserDB().getSnap(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List users = snapshot.data?.docs ?? [];
            User selecteduser = User("", "");
            String userId = "";
            String url = "";
            for (var i in users) {
              User currentUser = i.data();
              if (currentUser.getName() == data) {
                selecteduser = currentUser;
                userId = i.id;
                url = currentUser.getUrlImage();
                if (url == "") {
                  url =
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_bsppqvO4psg9azdZhSloO4mioLo-z5yl_IJO1In9Uw&s";
                }
                break;
              }
            }
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const BackButton(),
                      iconSize: 30,
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  child: ClipRRect(
                    child :Image.network(url,
                    fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    
                    ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name:",
                                  style: TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Email:",
                                  style: TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Phone no:",
                                  style: TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selecteduser.getName(),
                                  style: const TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  selecteduser.getEmail(),
                                  style: const TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  selecteduser.getPhoneNo(),
                                  style: const TextStyle(
                                    fontFamily: 'K2D',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}