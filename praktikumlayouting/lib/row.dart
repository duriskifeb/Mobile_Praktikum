import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Row Example')),

        body: Center(
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.purple, width: 4),
                ),
              ),

              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.purple, width: 4),
                ),
              ),

              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.purple, width: 4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
