import 'package:flutter/material.dart';
import 'package:hr/controllers/PageList.dart';
import 'package:hr/views/HR/AvailableView.dart';
import 'package:hr/views/HR/StatusUserView.dart';

class UsertListMaker extends StatelessWidget {
  final String name;
  
  PageList pageList = PageList();

  bool flag  =  false;

  UsertListMaker({Key? key, required this.name, required this.flag,required context}):super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
        child: GestureDetector(
          onTap: () {
            if (flag){ // Status
            pageList.routeToData(context, "StatusUser", StatusUser(data: name,),name);
            }
            else {  // NewEmployee
            pageList.routeToData(context, "AvailableUser", AvailableUser(data:name),name);
            }
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
