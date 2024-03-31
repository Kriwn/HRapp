class Department {
  late int _id; //PK
  late String _name;

  Department({required int id,required String name}){
    _id = id;
    _name = name;
  }

  // Getter
  int getID(){
    return _id;
  }

  String getName(){
    return _name;
  }

  // Setter

  void setID(int value){
    _id = value;
  }

  void setName(String name)
  {
    _name = name;
  }
}