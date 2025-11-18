import 'package:flutter/material.dart';

class Tabview extends StatelessWidget {
  const Tabview({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab View Example"),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("Home Tab")),
            Center(child: Text("Favorite Tab")),
            Center(child: Text("Settings Tab")),
          ],
        ),
        bottomNavigationBar: const Material(
          color: Colors.blue,
          child: TabBar(
            indicatorColor: Color.fromARGB(255, 0, 0, 0),
            labelColor: Color.fromARGB(255, 0, 0, 0),
            unselectedLabelColor: Color.fromARGB(179, 0, 0, 0),
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Beranda"),
              Tab(icon: Icon(Icons.favorite), text: "Favorite"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
            ],
          ),
        ),
      ),
    );
  }
}
