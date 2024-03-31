import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/models/department.dart';

class FireStoreService {
  // Declare a reference to the Firestore collection
  final CollectionReference department =
      FirebaseFirestore.instance.collection('department');


  Stream<QuerySnapshot> getAll(){
    return department.snapshots();
  }
}