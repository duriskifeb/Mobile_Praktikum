import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Column Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.star, color: Colors.amberAccent, size: 50.0),

              const Text('column flutter', style: TextStyle(fontSize: 16)),

              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.purple, width: 4),
                ),

                child: Text("Container dalam column"),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.purple, width: 4),
                ),

                child: Text("Container dalam column"),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.purple, width: 4),
                ),

                child: Text("Container dalam column"),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.purple, width: 4),
                ),

                child: Text("Container dalam column"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
