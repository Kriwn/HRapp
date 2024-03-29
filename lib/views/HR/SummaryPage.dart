import 'package:flutter/material.dart';

class SummaryList extends StatelessWidget {
  const SummaryList({Key? key}) : super(key: key);
  
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
          Text(
            "Screen Height: $screenHeight",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      );
  }
}
