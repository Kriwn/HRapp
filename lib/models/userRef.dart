import 'package:cloud_firestore/cloud_firestore.dart';

class UserRef {
  late CollectionReference _userRef;

  UserRef(this._userRef);

  UserRef.copy(CollectionReference? userRef){
    UserRef(userRef ?? _userRef);
  }

  UserRef.fromJson(Map<String, Object?> json, String userId){
    _userRef = json[userId] as CollectionReference;
  }

  Map<String, Object> toJson(String userId){
    return {
      userId : _userRef
    };
  }
}