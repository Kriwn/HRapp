import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 232, 223),
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
              
            },
          )
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 240, 240, 240),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Clock In", style: TextStyle(fontSize: 36),),
            IconButton(
              onPressed: () => {

              }, 
              icon: const Icon(Icons.check_circle, color: Colors.green, size: 250,),
            ),
            Text(formattedDate),
            const SizedBox(height: 5,),
            const Text("GPS :", style: TextStyle(fontSize: 36),),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("", style: TextStyle(fontSize: 36),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}