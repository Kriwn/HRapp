import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/services/Auth.dart';

class HistoryController {
  late String userCurrentId = Auth().currentUser!.uid;
  HistoryController();

  var snapshot;

  getSnapshot() {
    return snapshot = FirebaseFirestore.instance
                .collection("User")
                .doc(userCurrentId)
                .collection("History")
                .snapshots();
  }

}