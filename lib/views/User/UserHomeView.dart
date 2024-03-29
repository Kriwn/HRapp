import 'package:flutter/material.dart';
import 'package:hr/views/SettingsView.dart';
import 'package:hr/views/User/ClockInView.dart';
import 'package:hr/views/User/HistoryView.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int indextBottomNav = 0;
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
          IconButton(
            icon: Container(
              width: MediaQuery.of(context).size.width*0.080,
              height: MediaQuery.of(context).size.width*0.080,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Image.asset('assets/images/bigprk.png', fit: BoxFit.cover,),
              ),
            ),
            iconSize: 50,
            onPressed: () => {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const Settings()),
              )
            },
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 247, 197, 186),
      body: Center(
        child: WidgetOption[indextBottomNav],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 245, 187, 170),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.check_rounded), label: 'Clock In'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          // BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Departments'),
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