import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockIn extends StatefulWidget {
  const ClockIn({super.key});

  @override
  State<ClockIn> createState() => _ClockInState();
}

class _ClockInState extends State<ClockIn> {
  String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(DateTime.now());
  
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          )
          )
        ],
      );
  }
}