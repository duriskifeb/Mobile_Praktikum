import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _messeage = "Hello, Flutter!";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pertemuan 5 User Interaction'),
          actions: [
            PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ), // ikon titik tiga
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.person, color: Colors.blue),
                      SizedBox(width: 10),
                      Text("Profile"),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _messeage = "Option Profile Dipilih";
                    });
                    print("Button Profile Diklik!");
                  },
                ),
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.settings, color: Colors.green),
                      SizedBox(width: 10),
                      Text("Pengaturan"),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _messeage = "Option Pengaturan Dipilih";
                    });
                    print("Button Pengaturan Dipilih");
                  },
                ),
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.help_outline, color: Colors.orange),
                      SizedBox(width: 10),
                      Text("Apalah"),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _messeage = "Option Apalah Dipilih";
                    });
                    print("Button Apalah Dipilih");
                  },
                ),
              ],
            ),
          ],
        ),

        // Drawer sebagai navigasi samping
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Icon(Icons.person, size: 100, color: Colors.pink),
              ),
              ListTile(
                leading: const Icon(Icons.menu),
                title: const Text('Menu 1'),
                onTap: () {
                  setState(() {
                    _messeage = "Menu 1 Dipilih";
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu),
                title: const Text('Menu 2'),
                onTap: () {
                  setState(() {
                    _messeage = "Menu 2 Dipilih";
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu),
                title: const Text('Menu 3'),
                onTap: () {
                  setState(() {
                    _messeage = "Menu 3 Dipilih";
                  });
                },
              ),
            ],
          ),
        ),

        // Body atau event listener
        body: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_messeage),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _messeage = "Tombol Sudah diklik!";
                    });
                  },
                  child: const Text('Event Listener'),
                ),
                const SizedBox(height: 20),

                // Snack Bar
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Heyy, Tombol snack bar sudah diklik'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text("Snack Bar"),
                ),

                // Alert Dialog
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Konfirmasi"),
                          content: const Text(
                            "Apakah anda iya ingin melanjutkan?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _messeage = "Anda menekan Ya";
                                });
                                Navigator.of(context).pop();
                              },
                              child: const Text("Ya"),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _messeage = "Anda menekan Tidak";
                                });
                                Navigator.of(context).pop();
                              },
                              child: const Text("Tidak"),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _messeage = "Saya kurang yakin";
                                });
                                Navigator.of(context).pop();
                              },
                              child: const Text("Kurang Yakin"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text("Tampilkan Dialog"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
