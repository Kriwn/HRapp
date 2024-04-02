class Department {
  late String _name;

  Department({required String name}){
    _name = name;
  }

  Department.fromJson(Map<String, dynamic> json){
    _name = json['name'] as String;
  }

  Map<String, Object> toJson(){
    return {
      'name' : _name
    };
  }

  String getName(){
    return _name;
  }
}