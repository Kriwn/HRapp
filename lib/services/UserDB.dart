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

    Future<List<String>> getUsersByDepartmentId(String departmentId) async {
    List<String> userNames = [];

    try {
      var snapshot = await _userRef.where('Department_ID', isEqualTo: departmentId).get();
      snapshot.docs.forEach((doc) {
        var userData = doc.data() as User;
        if (userData != null ) {
          userNames.add(userData.getName());
        }
      });
    } catch (e) {
      print("Error getting users by department ID: $e");
    }

    return userNames;
  }

  Stream<QuerySnapshot> getSnap(){
    return _userRef.snapshots();
  }

  Future<User?> getUserByName(String name) async {
    late final user;

    try {
      var snapshot = await _userRef.where('Name', isEqualTo: name).get();
      snapshot.docs.forEach((doc) {
        var userData = doc.data();
        if (userData != null ) {
          user = userData as User;
        }
      });
    } catch (e) {
      print("Error getting users by department ID: $e");
    }
    return user;
  }


  Future<String?> getPhoneNo(String userId) async {
    try {
      var snapshot = await _userRef.doc(userId).get();
      if (snapshot.exists)
      {
        var userdata = snapshot.data();
        if (userdata != null){
          var user = userdata as User;
          return user.getPhoneNo();
        }
      } 
    } catch (e) {
      print("Error get Phone No.");
    }
    return null;
  }

  Future<String?> getUserName(String userId) async {
    try {
      var snapshot = await _userRef.doc(userId).get();
      if (snapshot.exists)
      {
        var userdata = snapshot.data();
        if (userdata != null){
          var user = userdata as User;
          return user.getName();
        }
      } 
    } catch (e) {
      print("Error get name");
    }
    return null;
  }

  Future<User?> getUser(String userId) async {
    try {
      var snapshot = await _userRef.doc(userId).get();
      if (snapshot.exists)
      {
        var userdata = snapshot.data();
        if (userdata != null){
          var user = userdata as User;
          return user;
        }
      } 
    } catch (e) {
      print("Error get Phone No.");
    }
    return null;
  }

  getUserByEmail(String email) {
    return _userRef.where('Email', isEqualTo: email);
  }

  getUsers() {
    return _userRef;
  }

  Future<User?> getAll(String userId) async {
    try {
      var snapshot = await _userRef.doc(userId).get();
      if (snapshot.exists) {
        var accountData = snapshot.data();
        if (accountData != null) {
          var account = accountData as User;
          return account;
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  void createUser(User user) async {
    _userRef.add(user);
  }

  void updateUser(String userId, User user) async {
    _userRef.doc(userId).update(user.toJson());
  }

  void addAccount(User user) async {
    _userRef.add(user);
  }

void updateDepartment(String accountID, String department) {
    getAll(accountID).then((value) => {
      value?.setDepartment(department),
      updateUser(accountID, value ?? User("NoUsername", "NoEmail"))
    });
  }


}