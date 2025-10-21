import 'package:flutter/material.dart';

class Nested extends StatelessWidget {
  const Nested({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text("Nested Row and Column")),
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Icon(Icons.home, size: 50, color: Colors.blue),
                SizedBox(height: 10),
                Text("data")
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Icon(Icons.favorite, size: 50, color: Colors.blue),
                SizedBox(height: 10),
                Text("data")
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Icon(Icons.settings, size: 50, color: Colors.blue),
                SizedBox(height: 10),
                Text("data")
              ],
            ),
          )
        ],
      ),
    ),
    );
  }
}
