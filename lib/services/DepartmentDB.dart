import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr/main.dart';

class DepartmentDB {
  final CollectionReference departmentCollection =
      FirebaseFirestore.instance.collection('department');
  late final CollectionReference _departmentRef;


  Stream<QuerySnapshot> getAll(){
    return departmentCollection.snapshots();
  }
}
