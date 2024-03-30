import 'package:flutter/material.dart';
import 'package:hr/controllers/PageList.dart';
import 'package:hr/views/SettingsView.dart';
import 'package:hr/views/User/ClockInView.dart';
import 'package:hr/views/User/HistoryView.dart';
import 'package:hr/views/Account/SignInView.dart';
import 'package:hr/views/components/IconPicture.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int indextBottomNav = 0;
  PageList pageList = PageList();
  List WidgetOption = [
    const ClockIn(),
    const History(),
    // const DepartmentList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Home Page"),
        actions: [
          IconPicture(50, 'assets/images/bigprk.png', "Settings"),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 247, 197, 186),
      body: Center(
        child: WidgetOption[indextBottomNav],
      ),
      // Google Nav Bar
      // bottomNavigationBar: Container(
      //   color: const Color.fromARGB(255, 245, 187, 170),
      //   child:  Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      //     child: GNav(
      //       backgroundColor: Color.fromARGB(255, 245, 187, 170),
      //       color: Colors.black,
      //       tabBackgroundColor: Colors.white,
      //       gap: 2,
      //       onTabChange: (index) {
      //         setState(() {
      //           indexBottomNavBar = WidgetOption[index]; 
      //         });
      //       },
      //       tabs: const [
      //         GButton(
      //           icon: Icons.check_rounded,
      //           text: "Clock In",
      //         ),
      //         GButton(
      //           icon: Icons.history,
      //           text: "History",
      //         )
      //       ]
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 245, 187, 170),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.check_rounded), label: 'Clock In'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          // Add more BottomNavigationBarItems as needed
        ],
        currentIndex: indextBottomNav,
        onTap: (value) {
          setState(() {
            indextBottomNav = value;
          });
        },
      ),
    );
  }
}