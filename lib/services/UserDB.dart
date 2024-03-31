import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/models/user.dart';

class UserDB {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');

  // Stream<QuerySnapshot> getId(){
  //   final DepartmentList = department.orderBy('ID',descending: false).snapshots();
  //   return DepartmentList;
  // }
  getUserByEmail(String email) {
    return userCollection.where('Email', isEqualTo: email);
  }

  getAvailableUsers() {
    return userCollection.where('Department_ID', isEqualTo: 'none');
  }

  getUsers() {
    return userCollection;
  }

  void createUser(User user) async {
    userCollection.add(user);
  }

  // void updateUserPhoneNoByEmail(String email, String phoneNo) async {
  //   userCollection.doc(email).update(data)
  // }

}