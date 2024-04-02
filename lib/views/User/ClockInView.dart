import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hr/main.dart';
import 'package:hr/models/history.dart';
import 'package:hr/services/Auth.dart';
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
  String todayClockIn = "";
  String nowStr = "";
  String topic = "Clock In";
  Icon buttonIcon = Icon(Icons.check_circle, color: Colors.green, size: 250,);
  
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
            History history = History.fromJson(i.data());
            if(i.id == DateFormat("dd-MMMM-yyyy").format(DateTime.now()) && history.getClockIn() != "") {
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
                  fontSize: 24,
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
                        Position position = await getLocation();

                        // Latitude(workplace), Longitude(worldplace), Latitude(current), Longitude(current), 
                        double distance = DistanceCalculator.calculateDistance(13.850265866144003, 100.57115897393285, position.latitude, position.longitude);
                        
                        if(distance <= 600) {
                          clockInTimeCheck = clockInController.ClockInTimeCheck(now);
                          clockOutTimeCheck = clockInController.ClockOutTimeCheck(now);
                          if(clockInTimeCheck) {
                            clockInController.ClockInFunc(userId, now);
                          } else if(clockOutTimeCheck && todayClockIn == "") {
                            setState(() {
                              topic = "Can't Clock Out due to no Clock In";
                              buttonIcon = Icon(Icons.close_rounded, color: Colors.red, size: 250,);
                            });
                          } else if(clockOutTimeCheck) {
                            clockInController.ClockOutFunc(userId, now, todayClockIn);
                          }
                          setState(() {
                            nowStr = DateFormat.Hm().format(now);
                          });
                        } else {
                          setState(() {
                            topic = "You are not in work place area.";
                            buttonIcon = Icon(Icons.close_rounded, color: Colors.red, size: 250,);
                          });
                        }
                      }, 
                      icon: buttonIcon,
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