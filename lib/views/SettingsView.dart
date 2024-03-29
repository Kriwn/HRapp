import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 197, 186),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => {
                  Navigator.pop(context)
                }, 
                icon: Icon(Icons.arrow_back_ios)
              )
            ],
          ),
          const Text(
            "Settings",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Padding(padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 240, 240, 240),  
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.7),
                spreadRadius: 4,
                blurRadius: 5,
                offset: const Offset(0,1.75))
              ]
            ),
          
            height: 0.7 * screenHeight,
            child: Container(
              
            )
          )
          )
        ],
      ),
    );
  }
}