import 'package:hr/services/UserDB.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr/services/Auth.dart';

class CheckLogin {
  final UserDB userDB = UserDB();

  final String _emailController;
  final String _passwordController;
  late String message;
  bool isConnected = false;

  CheckLogin(this._emailController, this._passwordController, this.message);


  Future<int> CheckDepartment() async {
    bool result = await InternetConnection().hasInternetAccess;

    if (result) {
      await Auth().signInWithEmailAndPassword(email: _emailController, password: _passwordController);
      try {
        String? department =
            await userDB.getDepartment(Auth().currentUser!.uid);
        print(department);

        if (department != null) {
          if (department == 'HR') {
            return 1;
          } else {
            return 0;
          }
        } else {
          return -1;
        }
      } catch (e) {
        print('Error during sign in: $e');
        return -1;
      }
    } else {
      return -1;
    }
  }
}
