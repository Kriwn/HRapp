import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/models/department.dart';

class DepartmentDB {
  final CollectionReference departmentCollection =
      FirebaseFirestore.instance.collection('department');
  
  late final CollectionReference _departmentRef;

  DepartmentDB(){
    _departmentRef = departmentCollection.withConverter<Department>(
      fromFirestore: (snapshot, _) => Department.fromJson(
        snapshot.data()!,),
      toFirestore: (department, _ ) =>  department.toJson());
  }

  Future<List<String>> getAllID() async {
    try {
      final querySnapshot = await departmentCollection.get();
      final collectionIds = querySnapshot.docs.map((doc) => doc.id).toList();
      return collectionIds;
    } catch (e) {
      print('Error getting collection IDs: $e');
      return [];
    }
  }


  Stream<QuerySnapshot> getAll(){
    return _departmentRef.snapshots();
  }
}
