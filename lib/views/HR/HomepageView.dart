import 'package:flutter/material.dart';
import 'DepartmentView.dart';
import 'NewemployeeView.dart';
import 'SummaryView.dart';
import 'package:hr/views/User/ClockInView.dart';
import 'package:hr/views/components/IconPicture.dart';

class HrHomepage extends StatefulWidget {
  const HrHomepage({super.key});

  @override
  State<HrHomepage> createState() => _HrHomepage();
}

class _HrHomepage extends State<HrHomepage> {
  int indextBottomNav = 0;
  List WidgetOption = [
    const SummaryList(),
    const NewEmployee(),
    const DepartmentList(),
    const ClockIn(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Test"),
          actions: [
            IconPicture(50, 'assets/images/bigprk.png', "Settings"),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 247, 197, 186),
        body: Center(
          child: WidgetOption[indextBottomNav],
        ),
        bottomNavigationBar: SafeArea(
          child: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 245, 187, 170),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: 'New employee'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.business), label: 'DepartMent'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_rounded), label: 'Clock In'),
              // Add more BottomNavigationBarItems as needed
            ],
            currentIndex: indextBottomNav,
            onTap: (value) {
              setState(() {
                indextBottomNav = value;
              });
            },
          ),
        ));
  }
}
