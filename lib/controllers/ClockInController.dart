import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/services/Auth.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class DistanceCalculator {
  static const earthRadius = 6371.0;

  static double degreesToRadians(double degrees) {
    return degrees * pi / 180.0;
  }

  static double haversine(double startLat, double startLon, double endLat, double endLon) {
    final dLat = degreesToRadians(endLat - startLat);
    final dLon = degreesToRadians(endLon - startLon);
    final a = pow(sin(dLat / 2), 2) +
        pow(sin(dLon / 2), 2) * cos(degreesToRadians(startLat)) * cos(degreesToRadians(endLat));
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    final distance = earthRadius * c;
    return distance;
  }

  static double calculateDistance(double startLat, double startLon, double endLat, double endLon) {
    final distance = haversine(startLat, startLon, endLat, endLon);
    return distance * 1000;
  }
}

class ClockInOut {

  bool ClockInTimeCheck(DateTime dateTime) {
    int timeHr = int.parse(DateFormat.H().format(dateTime));
    int timeMin = int.parse(DateFormat.m().format(dateTime));
    if(timeHr >= 5 && timeHr <= 9) {
      if(timeHr == 9 && timeMin > 0) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  bool ClockOutTimeCheck(DateTime dateTime) {
    int timeHr = int.parse(DateFormat.H().format(dateTime));
    int timeMin = int.parse(DateFormat.m().format(dateTime));
    if(timeHr >= 16 && timeHr <= 23) {
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