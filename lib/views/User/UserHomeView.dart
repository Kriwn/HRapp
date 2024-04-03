import 'package:flutter/material.dart';
import 'package:hr/controllers/PageList.dart';
import 'package:hr/services/Auth.dart';
import 'package:hr/services/UserDB.dart';
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
  late String todayClockIn;
  PageList pageList = PageList();

  List WidgetOption = [
    const ClockIn(),
    const HistoryView(),
  ];
  String url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_bsppqvO4psg9azdZhSloO4mioLo-z5yl_IJO1In9Uw&s";

  @override
  Widget build(BuildContext context) {
    if(url == "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_bsppqvO4psg9azdZhSloO4mioLo-z5yl_IJO1In9Uw&s"){
    UserDB().getAll(Auth().currentUser!.uid).then((value) => 
    setState(() {
      url = value?.getUrlImage() ?? "";
    })
  
    ,);
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 197, 186),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Auth().signOut();
                      pageList.routeTo(context, "SignIn");
                    },
                    icon: const Icon(Icons.logout)),
                const Spacer(),
                IconPicture(50, url, "Settings"),
              ],
            ),
            Center(
              child: WidgetOption[indextBottomNav],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 245, 187, 170),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.check_rounded), label: 'Clock In'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
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
