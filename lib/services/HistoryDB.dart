import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/models/history.dart';
import 'package:hr/main.dart';
import 'package:hr/models/userRef.dart';
import 'package:intl/intl.dart';

class HistoryDB {
  final userCollection =
      FirebaseFirestore.instanceFor(app: app).collection("User");

  final historyCollection =
      FirebaseFirestore.instanceFor(app: app).collection("History");

  late final CollectionReference _userRef;
  late final CollectionReference _historyRef;

  HistoryDB(String userId) {
    _historyRef = historyCollection.withConverter<History>(
        fromFirestore: (snapshot, _) => History.fromJson(
              snapshot.data()!,
            ),
        toFirestore: (history, _) => history.toJson());

    _userRef = userCollection.withConverter<UserRef>(
        fromFirestore: (snapshot, _) => UserRef.fromJson(
              snapshot.data()!, userId
            ),
        toFirestore: (userRef, _) => userRef.toJson(userId));
  }

  Future<CollectionReference?> getHistoryRef(String userId) async {
    try {
      print("UserID : $userId");
      print("_userRef : $_userRef");
      var snapshot = await _userRef
          .doc(userId)
          .get();
        if (snapshot.exists) {
          var historyRefData = snapshot.data();
          if (historyRefData != null) {
            var historyRef = historyRefData as CollectionReference;
            return historyRef;
          }
        } else {
          print("snapshot not exist");
        }
    } catch(e) {
      print("error : $e");
    }
  }

  Future<String?> getClockInTimeFromUserId(CollectionReference historyRef, DateTime dateTime) async {
    try {
      var snapshot = await historyRef
          .doc(DateFormat("dd-MMMM-yyyy").format(dateTime))
          .get();
      if (snapshot.exists) {
        var historyData = snapshot.data();
        if (historyData != null) {
          var history = historyData as History;
          return history.getClockIn();
        }
      } else {
        print("snapshot not exist");
      }
    } catch (e) {
      print("Error get history");
    }
    return null;
  }
}
