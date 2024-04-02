import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr/main.dart';
import 'package:hr/models/history.dart';
import 'package:hr/services/Auth.dart';
import 'package:hr/services/HistoryDB.dart';
import 'package:hr/services/LocationService.dart';
import 'package:hr/views/User/HistoryView.dart';
import 'package:intl/intl.dart';
import 'package:hr/controllers/ClockInController.dart';

class ClockIn extends StatefulWidget {
  const ClockIn({super.key});

  @override
  State<ClockIn> createState() => _ClockInState();
}

class _ClockInState extends State<ClockIn> {
  ClockInOut clockInController = ClockInOut();
  String userId = Auth().currentUser!.uid;
  DateTime now = DateTime.now();
  late bool clockInTimeCheck;
  late bool clockOutTimeCheck;
  late String todayClockIn;
  String nowStr = "";
  String topic = "Clock In";
  
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if(clockInController.ClockOutTimeCheck(now)) {
      topic = "Clock Out";
    }

    return StreamBuilder(
      stream: FirebaseFirestore.instance
                .collection("User")
                .doc(Auth().currentUser!.uid)
                .collection("History")
                .snapshots(),
      builder: (context, snapshot) {
        List historyList = snapshot.data?.docs ?? [];
          for(var i in historyList) {
            if(i.id == DateFormat("dd-MMMM-yyyy").format(DateTime.now())) {
              History history = History.fromJson(i.data());
              print("${i.id} => ${history.getClockIn()}");
              todayClockIn = history.getClockIn();
            }
            
          }
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                topic,
                style: const TextStyle(
                  fontSize: 36,
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
                    StreamBuilder(
                      stream: Stream.periodic(const Duration(seconds: 1)),
                      builder: (context, snapshot) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            "${DateFormat("dd/MM/yyyy").format(now)}\n${DateFormat.Hms().format(now)}", 
                            style: const TextStyle(fontSize: 36), 
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                    ),
                    IconButton(
                      onPressed: () async {
                        // getLocation();
                        clockInTimeCheck = clockInController.ClockInTimeCheck(now);
                        clockOutTimeCheck = clockInController.ClockOutTimeCheck(now);
                        if(clockInTimeCheck) {
                          clockInController.ClockInFunc(userId, now);
                        } else if(clockOutTimeCheck) {
                          clockInController.ClockOutFunc(userId, now, todayClockIn);
                        }
                        setState(() {
                          nowStr = DateFormat.Hm().format(now);
                        });
        
                      }, 
                      icon: const Icon(Icons.check_circle, color: Colors.green, size: 250,),
                    ),
                    // Can use device's dateTime to check due to check internet connection already(if change device's dateTime = can not use internet)
        
                    Text(nowStr, style: const TextStyle(fontSize: 24),),
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
    );
  }
}