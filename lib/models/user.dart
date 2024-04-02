
class User {
  late String _urlImage;
  late String _Name;
  late String _phoneNo;
  late String _email;
  late final String _username;
  late String _departmentID;
  

  User(this._username, this. _email){
    _departmentID = "none";
    _urlImage = "";
    _Name = "";
    _phoneNo = "";
  }

  User.withAll(String? username, String? email, String? name, 
                String? id, String? phone, String? url) {
                  username ?? _username;
                  email ?? _email;
                  name ?? _Name;
                  id ?? _departmentID;
                  phone ?? _phoneNo;
                  url ?? _urlImage;
                }

  User.copy(String? username, String? email, String? name, 
                String? id, String? phone, String? url){
                  User.withAll(username ?? _username, email ?? _email, name ?? _Name,
                                     id ?? _departmentID, phone ?? _phoneNo, url ?? _urlImage);
                }

  User.fromJson(Map<String, Object?> json){
    _username = json['Username'] as String;
    _Name  = json['Name'] as String;
    _email = json['Email'] as String;
    _phoneNo = json['Phone'] as String;
    _departmentID = json['Department_ID'] as String;
    _urlImage = json['URL_Image'] as String;
  }


  Map<String, Object> toJson(){
    return {
      'Username' : _username,
      'Name' : _Name,
      'Email' : _email,
      'Phone' : _phoneNo,
      'Department_ID' :  _departmentID,
      'URL_Image' : _urlImage,
    };
  }

  String getUrlImage(){
    return _urlImage;
  }

  String getName() {
    return _Name;
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

  String getDepartmentID() {
    return _departmentID;
  }

  // History getHistory() {
  //   return _history;
  // }

  void setUrlImage(String newUrl) {
    _urlImage = newUrl;
  }

  void setPhoneNo(String newPhoneNo) {
    _phoneNo = newPhoneNo;
  }

  void setEmail(String newEmail) {
    _email = newEmail;
  }

  void setDepartment(String string){
    _departmentID = string;
  }

}