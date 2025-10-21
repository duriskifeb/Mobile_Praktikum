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
          // bottom: const TabBar(
          //   tabs: [
          //     Tab(icon: Icon(Icons.home), text: "Home",),
          //     Tab(icon: Icon(Icons.favorite), text: "Favorite",),
          //     Tab(icon: Icon(Icons.settings), text: "Settings",),
          //   ],
          // ),
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
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
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
