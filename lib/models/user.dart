import 'package:hr/models/history.dart';

class User {
  late int _id;
  late String _urlImage;
  late String _firstName;
  late String _lastName;
  late String _phoneNo;
  late String _email;
  late String _username;
  late int _departmentID;
  late History _history;
  
  int getID() {
    return _id;
  }

  String getUrlImage(){
    return _urlImage;
  }

  String getFirstName() {
    return _firstName;
  }

  String getLastName() {
    return _lastName;
  }

  String getPhoneNo() {
    return _phoneNo;
  }

  String getEmail() {
    return _email;
  }

  String getUsername() {
    return _username;
  }

  int getDepartmentID() {
    return _departmentID;
  }

  History getHistory() {
    return _history;
  }

  void setUrlImage(String newUrl) {
    _urlImage = newUrl;
  }

  void setPhoneNo(String newPhoneNo) {
    _phoneNo = newPhoneNo;
  }

  void setEmail(String newEmail) {
    _email = newEmail;
  }

}