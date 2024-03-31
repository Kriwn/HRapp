import 'package:flutter/material.dart';
import 'package:hr/services/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/main.dart';
import 'package:hr/models/user.dart';

class SignUpController {
  var collection = FirebaseFirestore.instanceFor(app: app).collection("User");
  var data;

  addData(String username, String email, String phone, String name, String departmentID) async {
    final data1 = <String, dynamic>{
      "Username": username,
      "Email": email,
      "Phone": phone,
      "Name":  name,
      "URL_Image" : "",
      "Department_ID" : departmentID,
    };
    collection.doc(auth.currentUser!.uid).set(data1);
  }
}