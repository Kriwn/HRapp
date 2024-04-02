import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr/controllers/PageList.dart';
import 'package:hr/controllers/departmentcontroller.dart';
import 'package:hr/models/department.dart';
import 'package:hr/models/user.dart';
import 'package:hr/services/DepartmentDB.dart';
import 'package:hr/services/UserDB.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class AvailableUser extends StatefulWidget {
  final dynamic data;

  AvailableUser({required this.data});

  @override
  _AvailableUserState createState() => _AvailableUserState(data: data);
}

class _AvailableUserState extends State<AvailableUser> {
  Future<User>? _user;

  final dynamic data;

  _AvailableUserState({required this.data});

  @override
  void initState() {
    super.initState();
    _user = DepartmentController().getUserFromName(data);
  }

  String dropDownValue = "";

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
                      StreamBuilder(
                        stream: DepartmentDB().getAll(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            List<DocumentSnapshot> departments =
                                snapshot.data!.docs;
                            List<ValueItem> departmentNames = [];
                            int i = 0;
                            departments.forEach((element) {
                              departmentNames
                                  .add(ValueItem(label: element.id, value: i));
                              print(element.id);
                              i++;
                            });
                            if (departmentNames.isEmpty) {
                              return Text("ISEMpty");
                            }
                            return MultiSelectDropDown(
                              onOptionSelected: (selectedOptions) {
                                // PageList pageList = PageList();
                                UserDB().updateDepartment(userId,
                                    selectedOptions.first.label.toString());

                                Navigator.pop(context);
                              },
                              options: departmentNames,
                              selectionType: SelectionType.single,
                              chipConfig: ChipConfig(wrapType: WrapType.wrap),
                              dropdownHeight: 300,
                              optionTextStyle: TextStyle(fontSize: 16),
                              selectedOptionIcon: Icon(Icons.check_circle),
                            );
                          }
                        },
                      ),
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
