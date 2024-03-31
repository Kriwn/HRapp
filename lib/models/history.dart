import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  late int id; //Foreign Key from user
  late Timestamp date; 
  late String status;
}