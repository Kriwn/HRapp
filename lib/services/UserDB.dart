import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/models/user.dart';
import 'package:hr/main.dart';

class UserDB {
  final  userCollection =
      FirebaseFirestore.instanceFor(app: app).collection("User");

  late final CollectionReference _userRef;

  UserDB(){
    _userRef = userCollection.withConverter<User>(
        fromFirestore: (snapshot, _) => User.fromJson(
          snapshot.data()!,), 
          toFirestore: (user, _) => user.toJson());
  }

  // Stream<QuerySnapshot> getId(){
  //   final DepartmentList = department.orderBy('ID',descending: false).snapshots();
  //   return DepartmentList;
  // }

  Future<String?> getDepartment(String userId) async {
    try {
      var snapshot = await _userRef.doc(userId).get();
      if (snapshot.exists)
      {
        var userdata = snapshot.data();
        if (userdata != null){
          var user = userdata as User;
          return user.getDepartmentID();
        }
      } 
    } catch (e) {
      print("Error get Department");
    }
    return null;
  }

  getUserByEmail(String email) {
    return _userRef.where('Email', isEqualTo: email);
  }

  getAvailableUsers() {
    return _userRef.where('Department_ID', isEqualTo: 'none');
  }

  getUsers() {
    return _userRef;
  }

  void createUser(User user) async {
    _userRef.add(user);
  }

  void updateUser(String userId, User user) async {
    _userRef.doc(userId).update(user.toJson());
  }

}