import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('GridView Example')),

        body: GridView.count(
          //grid dengan 2 kolom
          crossAxisCount: 2,

          //jarak antar item
          crossAxisSpacing: 5,

          //jarak antar baris
          mainAxisSpacing: 10.0,

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
    );
  }
}
