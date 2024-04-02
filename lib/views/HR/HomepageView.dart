import 'package:flutter/material.dart';
import 'package:hr/controllers/PageList.dart';
import 'package:hr/services/Auth.dart';
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
  PageList pageList = PageList();
  int indextBottomNav = 0;
  List WidgetOption = [
    SummaryList(),
    NewEmployee(),
    DepartmentList(),
    const ClockIn(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 197, 186),
        body: Column(
          children: [
              const SizedBox(height: 20,),
              Row(
                children: [
                  IconButton(onPressed: (){
                    Auth().signOut();
                    pageList.routeTo(context, "SignIn");
                  }, icon: const Icon(Icons.logout)),
                  Spacer(),
                  IconPicture(50, 'assets/images/bigprk.png', "Settings"),],
                ),
            Center(
              child: WidgetOption[indextBottomNav],
            ),
          ],
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
