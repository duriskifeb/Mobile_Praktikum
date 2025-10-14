import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Container Example')),

        body: Center(
          child: Container(
            width: 200,
            height: 200,

            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.black, width: 5),
            ),

            child: Text('Ini Container'),
          ),
        ),
      ),
    );
  }
}
