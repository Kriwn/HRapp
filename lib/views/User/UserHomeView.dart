import 'package:flutter/material.dart';
import 'package:hr/controllers/PageList.dart';
import 'package:hr/services/Auth.dart';
import 'package:hr/views/User/ClockInView.dart';
import 'package:hr/views/User/HistoryView.dart';
import 'package:hr/views/components/IconPicture.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Auth().signOut();
                    pageList.routeTo(context, "SignIn");
                  },
                  icon: const Icon(Icons.logout)),
              Spacer(),
              IconPicture(50, 'assets/images/bigprk.png', "Settings"),
            ],
          ),
          Center(
            child: WidgetOption[indextBottomNav],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 245, 187, 170),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.check_rounded), label: 'Clock In'),
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
