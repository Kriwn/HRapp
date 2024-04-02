import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/services/Auth.dart';
import 'package:hr/services/UserDB.dart';
import 'package:intl/intl.dart';

class ClockInOut {

  bool ClockInTimeCheck(DateTime dateTime) {
    int timeHr = int.parse(DateFormat("hh").format(dateTime));
    int timeMin = int.parse(DateFormat("mm").format(dateTime));
    if(5 >= timeHr && timeHr <= 9) {
      if(timeHr == 9 && timeMin > 0) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  bool ClockOutTimeCheck(DateTime dateTime) {
    int timeHr = int.parse(DateFormat("hh").format(dateTime));
    int timeMin = int.parse(DateFormat("mm").format(dateTime));
    if(16 >= timeHr && timeHr <= 23) {
      if(timeHr == 16 && timeMin < 30) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  void ClockOutFunc(String userId, DateTime dateTime, String clockIn) async {
    await FirebaseFirestore.instance
    .collection("User")
    .doc(Auth().currentUser!.uid)
    .collection("History")
    .doc(DateFormat("dd-MMMM-yyyy").format(dateTime))
    .update({
      'ClockIn': clockIn,
      'ClockOut': DateFormat.Hm().format(dateTime)
    });
  }

  void ClockInFunc(String userId, DateTime dateTime) async {
    await FirebaseFirestore.instance
    .collection("User")
    .doc(Auth().currentUser!.uid)
    .collection("History")
    .doc(DateFormat("dd-MMMM-yyyy").format(dateTime))
    .set({
      'ClockIn': DateFormat.Hm().format(dateTime),
      'ClockOut': ""
    });
  }

  String timeCheck(DateTime inTime, DateTime now) {
    String result = "";
    return result;
  }
  
}