import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/models/department.dart';
import 'package:hr/main.dart';

class DepartmentDB {
  final CollectionReference _department = FirebaseFirestore.instanceFor(app: app);

  late final CollectionReference _reference;

  DepartmentDB(){
    _reference = _department.
  }



  Stream<QuerySnapshot> getAll(){
    return _department.snapshots();
  }

}
