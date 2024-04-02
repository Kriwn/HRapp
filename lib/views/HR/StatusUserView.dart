import 'package:flutter/material.dart';

class StatusUser extends StatefulWidget {
  final dynamic data;

  StatusUser({required this.data});

  @override
  _StatusUser createState() => _StatusUser(data: data);
  
}

class _StatusUser extends State<StatusUser> {
  // Future<List<String>>? _UsernameList;
  
  final dynamic data;
  
  _StatusUser({required this.data});

  @override
  void initState(){
    super.initState();
    // _UsernameList = DepartmentController().getNameByDepartment(data);
  }
  

  @override
  Widget build(BuildContext context) {
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
        
      ],
      )
    );
  }
}