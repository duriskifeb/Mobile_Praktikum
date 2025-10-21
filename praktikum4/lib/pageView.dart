import 'package:flutter/material.dart';

class Pageview extends StatelessWidget {
  const Pageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("page view Example")),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            color: Colors.red,
            child: const Center(
              child: Text(
                "Page 1",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: const Center(
              child: Text(
                "Page 1",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text(
                "Page 1",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
