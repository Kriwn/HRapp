import 'department.dart';

class DepartmentList<T extends Department> {
  final List<T> _departments = [];

  void addDepartment(T department) {
    _departments.add(department);
  }

  void removeDepartment(T department) {
    _departments.remove(department);
  }
  
  T? findByDepartmentName(String name) {
    for (var department in _departments) {
      if (department.getName() == name) {
        return department;
      }
    }
    return null;
  }

  List<T> get departments => _departments;
}
