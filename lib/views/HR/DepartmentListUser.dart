import 'package:flutter/material.dart';
import 'package:hr/controllers/departmentcontroller.dart';
import 'package:hr/views/components/UserListmaker.dart';


class DepartmentListUser extends StatefulWidget {
  final dynamic data;

  DepartmentListUser({required this.data});

  @override
  _DepartmentListState createState() => _DepartmentListState(data: data);
  
}

class _DepartmentListState extends State<DepartmentListUser> {
  Future<List<String>>? _UsernameList;
  
  final dynamic data;
  
  _DepartmentListState({required this.data});

  @override
  void initState(){
    super.initState();
    _UsernameList = DepartmentController().getNameByDepartment(data);
  }
  

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 197, 186),
      body: Column(
      children: [
        const SizedBox(height: 20,),
        Row(
          children: [
            IconButton(onPressed: (){
              Navigator.of(context).pop();
                  }, icon: const BackButton(),
                  iconSize: 30,),
          ],
        ),
          Text(
          widget.data.toString(),
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 240, 240, 240),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: const Offset(0, 1.75))
                ]),
            height: 0.7 * screenHeight,
            child: FutureBuilder<List<String>>(
              future: _UsernameList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<String> UserList = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: UserList.length,
                    itemBuilder: (context, index) {
                      return UsertListMaker(
                        name: UserList[index],
                        context: context,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ],
      )
    );
  }
}
