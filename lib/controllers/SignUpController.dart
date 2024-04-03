import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/main.dart';
import 'package:intl/intl.dart';

class SignUpController {
  var collection = FirebaseFirestore.instanceFor(app: app).collection("User");
  var data;

  addData(String username, String email, String phone, String name, String departmentID) async {
    final data1 = <String, dynamic>{
      "Username": username,
      "Email": email,
      "Phone": phone,
      "Name":  name,
      "URL_Image" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_bsppqvO4psg9azdZhSloO4mioLo-z5yl_IJO1In9Uw&s",
      "Department_ID" : departmentID,
    };
    collection.doc(auth.currentUser!.uid).set(data1);
    collection.doc(auth.currentUser!.uid)
    .collection("History")
    .doc(DateFormat("dd-MMMM-yyyy").format(DateTime.now()))
    .set({
      'ClockIn': "",
      'ClockOut': "",
    });
  }
}