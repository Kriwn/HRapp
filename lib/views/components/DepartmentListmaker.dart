import 'package:flutter/material.dart';
import 'package:hr/controllers/PageList.dart';
import 'package:hr/views/HR/DepartmentListUserView.dart';

class DepartmentListMaker extends StatelessWidget {
  final String name;
  
  PageList pageList = PageList();

  DepartmentListMaker({Key? key, required this.name, required context}):super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
        child: GestureDetector(
          onTap: () {
            // create page for it UserList
            pageList.routeToData(context, "DepartmentListUser",DepartmentListUser(data: name,),name);
          },
      
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              const SizedBox(width: 20,),
              Text(name,style: const TextStyle(
                fontSize: 20,
                fontFamily: "K2D",
          
              ),
              )
            ],
          ),
        ),
      ),
        )
    );
  }
}
