import 'package:flutter/material.dart';

class AvailableUser extends StatefulWidget {
  final dynamic data;

  AvailableUser({required this.data});

  @override
  _AvailableUser createState() => _AvailableUser(data: data);
}

class _AvailableUser extends State<AvailableUser> {
  // Future<List<String>>? _UsernameList;

  final dynamic data;

  _AvailableUser({required this.data});

  @override
  void initState() {
    super.initState();
    // _UsernameList = DepartmentController().getNameByDepartment(data);
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 247, 197, 186),
    body: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const BackButton(),
              iconSize: 30,
            ),
          ],
        ),
        const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name:",
                      style: TextStyle(
                        fontFamily: 'K2D',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Username:",
                      style: TextStyle(
                        fontFamily: 'K2D',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Email:",
                      style: TextStyle(
                        fontFamily: 'K2D',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Phone no:",
                      style: TextStyle(
                        fontFamily: 'K2D',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kritt Wongwandee",
                      style: TextStyle(
                        fontFamily: 'K2D',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Kriwn",
                      style: TextStyle(
                        fontFamily: 'K2D',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "non1@gmail.com",
                      style: TextStyle(
                        fontFamily: 'K2D',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "1231231231",
                      style: TextStyle(
                        fontFamily: 'K2D',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
}