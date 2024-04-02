import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr/models/history.dart';
import 'package:hr/services/Auth.dart';
import 'package:intl/intl.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  String topic = "History";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topic,
            style: const TextStyle(
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
              child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                                  .collection("User")
                                  .doc(Auth().currentUser!.uid)
                                  .collection("History")
                                  .snapshots(),
                        builder: (context, snapshot) {
                          List historyList = snapshot.data?.docs ?? [];
                          return ListView.builder(
                            itemCount: historyList.length,
                            itemBuilder: (context, index) {
                              // print("asdasdadasdasdasas${historyList[index].data()}");
                              History history = History.fromJson(historyList[index].data());
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.yellow, width: 2.0)),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    tileColor: Theme.of(context).colorScheme.primaryContainer,
                                    title: Text(historyList[index].id),
                                    subtitle: Text(
                                      "Check In : ${history.getClockIn()}\nCheck Out : ${history.getClockOut()}",
                                    ),
                                    trailing: Checkbox(
                                      value: true,
                                      onChanged: (value) {
                                        false;
                                      },
                                    ),
                                  ),
                                )
                              );
                            }
                          );
                        }
                        
              ),
            ),
          ),
        ],
      );
  }
}