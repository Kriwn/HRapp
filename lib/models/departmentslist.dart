import 'department.dart';

class DepartmentList<T extends Department> {
  final List<T> _departments = [];

  void addDepartment(T department) {
    _departments.add(department);
  }

  void removeDepartment(T department) {
    _departments.remove(department);
  }
  
  T? findByDepartmentId(int id) {
    for (var department in _departments) {
      if (department.getID() == id) {
        return department;
      }
    }
    return null;
  }

  List<T> get departments => _departments;
}
