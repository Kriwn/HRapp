import 'package:flutter/material.dart';
import 'package:hr/controllers/departmentcontroller.dart';
import 'package:hr/views/components/DepartmentListmaker.dart';

class SummaryList extends StatefulWidget {
  @override
  _SumarryListState createState() => _SumarryListState();
}

class _SumarryListState extends State<SummaryList> {
  Future<List<String>>? _departmentIDs;

@override
void initState() {
  super.initState();
  _departmentIDs = DepartmentController().getId();

}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Summary",
          style: TextStyle(
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
              future: _departmentIDs,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<String> departmentIDs = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return DepartmentListMaker(
                        name: departmentIDs[index],
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
    );
  }
}