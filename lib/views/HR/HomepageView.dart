import 'package:flutter/material.dart';
import 'DepartmentView.dart';
import 'NewemployeeView.dart';
import 'SummaryView.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(83, 151, 193, 1),
        title: const Text("Test"),
      ),
      backgroundColor: const Color.fromARGB(255, 247, 197, 186),
      body: Center(
        child: WidgetOption[indextBottomNav],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 245, 187, 170),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Summary'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add employee'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Departments'),
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
