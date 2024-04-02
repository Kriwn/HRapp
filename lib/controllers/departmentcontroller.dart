import 'package:hr/models/user.dart';
import 'package:hr/services/DepartmentDB.dart';
import 'package:hr/services/UserDB.dart';

class DepartmentController {
  final DepartmentDB departmentDB = DepartmentDB();
  final UserDB userDB = UserDB();
  late List<String> list;
  late User user;

  DepartmentController() {
    list = [];
  }
  Future<List<String>> getId() async {
    list = await departmentDB.getAllID();
    return list;
  }

  Future<List<String>> getNameByDepartment(String departmentId) async {
    try {
      List<String> userNames =
          await userDB.getUsersByDepartmentId(departmentId);
      return userNames;
    } catch (e) {
      print("Error getting user names by department ID: $e");
      return []; // Return an empty list or handle the error as appropriate.
    }
  }

  Future<User> getUserFromName(String name) async {
    User? user = await userDB.getUserByName(name);
    if (user != null) {
      return user;
    } else {
      throw Exception("User not found"); // or any other appropriate error
    }
  }
  
}
