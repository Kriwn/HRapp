import 'user.dart';

class UserList<T extends User> {
  final List<T> _users = [];

  void addUser(T user) {
    _users.add(user);
  }

  void removeUser(T users) {
    _users.remove(users);
  }
  
  T? findByUserID(int id) {
    for (var user in _users) {
      if (user.getID() == id) {
        return user;
      }
    }
    return null;
  }

  List<T> get users => _users;
}
