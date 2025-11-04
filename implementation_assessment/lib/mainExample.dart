// import 'package:flutter/material.dart';

// // Ganti main() Anda untuk menjalankan aplikasi ini
// void main() {
//   runApp(const BlogWriterApp());
// }

// class BlogWriterApp extends StatelessWidget {
//   const BlogWriterApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Aplikasi Penulis Blog',
//       theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
//       home: const BlogHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// // Halaman utama diubah menjadi StatefulWidget untuk mengelola state BottomNavBar
// class BlogHomePage extends StatefulWidget {
//   const BlogHomePage({super.key});

//   @override
//   State<BlogHomePage> createState() => _BlogHomePageState();
// }

// class _BlogHomePageState extends State<BlogHomePage> {
//   int _selectedIndex = 0; // State untuk melacak tab yang aktif

//   // Daftar halaman/widget untuk setiap tab
//   static const List<Widget> _widgetOptions = <Widget>[
//     DashboardTab(), // Intro, Container, Row, Column, Nested
//     PostsTab(), // ListView, GridView
//     InteractionsTab(), // Button click, Snackbar, Dialog
//     FeaturedTab(), // PageView
//   ];

//   // Fungsi untuk mengubah state saat tab di bottom bar diketuk
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // DefaultTabController sudah tidak diperlukan lagi di sini
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dasbor Penulis'),
//         // Properti 'bottom' (TabBar) dihapus dari AppBar
//       ),
//       // === REQUIREMENT: Drawer ===
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             UserAccountsDrawerHeader(
//               accountName: const Text('Rizky (Anda)'),
//               accountEmail: const Text('rizky.penulis@email.com'),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Text(
//                   'R',
//                   style: TextStyle(
//                     fontSize: 40.0,
//                     color: Colors.deepPurple[900],
//                   ),
//                 ),
//               ),
//               decoration: const BoxDecoration(color: Colors.deepPurple),
//             ),
//             ListTile(
//               leading: const Icon(Icons.person),
//               title: const Text('Profil Saya'),
//               onTap: () => Navigator.pop(context),
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings),
//               title: const Text('Pengaturan'),
//               onTap: () => Navigator.pop(context),
//             ),
//             const Divider(),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text('Keluar'),
//               onTap: () => Navigator.pop(context),
//             ),
//           ],
//         ),
//       ),
//       // === REQUIREMENT: Tab View ===
//       // Diubah dari TabBarView menjadi IndexedStack
//       // IndexedStack menjaga state setiap halaman tab agar tidak hilang saat berpindah
//       body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
//       // === PERUBAHAN: Menambahkan BottomNavigationBar ===
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dasbor'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.article),
//             label: 'Postingan',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Interaksi'),
//           BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Sorotan'),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.deepPurple, // Warna item yang aktif
//         unselectedItemColor: Colors.grey, // Warna item yang tidak aktif
//         showUnselectedLabels: true, // Tampilkan label di item yang tidak aktif
//         type: BottomNavigationBarType.fixed, // Mencegah item bergeser
//         onTap: _onItemTapped, // Memanggil fungsi saat item diketuk
//       ),
//     );
//   }
// }

// // --- 1. Tab Dasbor (Intro, Container, Row, Column, Nested) ---
// class DashboardTab extends StatelessWidget {
//   const DashboardTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // === REQUIREMENT: Introdart (Teks Intro) ===
//           Text(
//             'Selamat Datang, Rizky!',
//             style: Theme.of(context).textTheme.headlineSmall,
//           ),
//           const Text('Ini adalah ringkasan statistik blog Anda.'),
//           const SizedBox(height: 24),

//           // === REQUIREMENT: Container, Row, Column, Nested Layout ===
//           Text(
//             'Statistik Bulan Ini',
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//           const SizedBox(height: 12),
//           // Widget Container untuk membuat "kartu"
//           Container(
//             padding: const EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: Colors.deepPurple[50],
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             // Widget Row untuk menyusun statistik secara horizontal
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 // Widget Column untuk menyusun angka & label (Nested Layout)
//                 _buildStatColumn('Postingan', '12'),
//                 _buildStatColumn('Dilihat', '2.4K'),
//                 _buildStatColumn('Suka', '150'),
//               ],
//             ),
//           ),
//           // Anda bisa menambahkan widget lain di sini
//         ],
//       ),
//     );
//   }

//   // Helper widget untuk membuat 1 stat (Column)
//   Widget _buildStatColumn(String label, String value) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           value,
//           style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 4),
//         Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
//       ],
//     );
//   }
// }

// // --- 2. Tab Postingan (ListView & GridView) ---
// // Menggunakan StatefulWidget untuk menyimpan state (List/Grid)
// class PostsTab extends StatefulWidget {
//   const PostsTab({super.key});

//   @override
//   State<PostsTab> createState() => _PostsTabState();
// }

// class _PostsTabState extends State<PostsTab> {
//   bool _isGridView = false; // State untuk toggle
//   final List<String> posts = List.generate(
//     15,
//     (index) => 'Postingan Blog #${index + 1}',
//   );

//   void _toggleView() {
//     setState(() {
//       _isGridView = !_isGridView;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Tombol Toggle
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text('Semua Postingan Anda'),
//               IconButton(
//                 icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view),
//                 onPressed: _toggleView,
//                 tooltip: 'Ubah Tampilan',
//               ),
//             ],
//           ),
//         ),
//         // === REQUIREMENT: ListView & GridView ===
//         Expanded(child: _isGridView ? _buildGridView() : _buildListView()),
//       ],
//     );
//   }

//   // Widget untuk List View
//   Widget _buildListView() {
//     return ListView.builder(
//       itemCount: posts.length,
//       itemBuilder: (context, index) {
//         return Card(
//           margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//           child: ListTile(
//             leading: const Icon(Icons.article_outlined),
//             title: Text(posts[index]),
//             subtitle: const Text('Dipublikasikan: 2 Nov 2025'),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 14),
//           ),
//         );
//       },
//     );
//   }

//   // Widget untuk Grid View
//   Widget _buildGridView() {
//     return GridView.count(
//       crossAxisCount: 2, // 2 Kolom
//       padding: const EdgeInsets.all(8),
//       children: posts.map((post) {
//         return Card(
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               image: DecorationImage(
//                 image: NetworkImage(
//                   'https://placehold.co/200x200/E1BEE7/000000?text=${Uri.encodeComponent(post)}',
//                 ),
//                 fit: BoxFit.cover,
//                 onError: (error, stackTrace) {}, // Handle error
//               ),
//             ),
//             // Fallback jika gambar gagal
//             child: Image.network(
//               'https://placehold.co/200x200/E1BEE7/000000?text=${Uri.encodeComponent(post)}',
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) =>
//                   Center(child: Text(post, textAlign: TextAlign.center)),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

// // --- 3. Tab Interaksi (Button, Change, Snackbar, Dialog) ---
// // Menggunakan StatefulWidget untuk menyimpan state
// class InteractionsTab extends StatefulWidget {
//   const InteractionsTab({super.key});

//   @override
//   State<InteractionsTab> createState() => _InteractionsTabState();
// }

// class _InteractionsTabState extends State<InteractionsTab> {
//   String _statusMessage = 'Belum ada aksi';

//   // === REQUIREMENT: Clicked button n changes ===
//   void _publishPost() {
//     setState(() {
//       _statusMessage = 'Postingan baru berhasil dipublikasikan!';
//     });
//     // Panggil snackbar setelah state berubah
//     _showSnackbar();
//   }

//   // === REQUIREMENT: Show snackbar ===
//   void _showSnackbar() {
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: const Text('Sukses! Postingan Anda sudah tayang.'),
//         backgroundColor: Colors.green,
//         action: SnackBarAction(
//           label: 'OK',
//           textColor: Colors.white,
//           onPressed: () {},
//         ),
//       ),
//     );
//   }

//   // === REQUIREMENT: Show dialog ===
//   void _showDeleteDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Konfirmasi Hapus'),
//           content: const Text(
//             'Apakah Anda yakin ingin menghapus draf ini? Aksi ini tidak bisa dibatalkan.',
//           ),
//           actions: [
//             TextButton(
//               child: const Text('Batal'),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             TextButton(
//               style: TextButton.styleFrom(foregroundColor: Colors.red),
//               child: const Text('Hapus'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 setState(() {
//                   _statusMessage = 'Draf telah dihapus.';
//                 });
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             'Tulis Postingan Cepat',
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//           const SizedBox(height: 16),
//           const TextField(
//             decoration: InputDecoration(
//               labelText: 'Judul Postingan',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 12),
//           const TextField(
//             decoration: InputDecoration(
//               labelText: 'Isi postingan...',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: 4,
//           ),
//           const SizedBox(height: 20),
//           // Tombol 1: Publish (Click & Change State, Show Snackbar)
//           ElevatedButton.icon(
//             icon: const Icon(Icons.publish),
//             label: const Text('Publikasikan'),
//             onPressed: _publishPost,
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 12),
//             ),
//           ),
//           const SizedBox(height: 10),
//           // Tombol 2: Hapus (Show Dialog)
//           ElevatedButton.icon(
//             icon: const Icon(Icons.delete_outline),
//             label: const Text('Hapus Draf'),
//             onPressed: _showDeleteDialog,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red[100],
//               foregroundColor: Colors.red[900],
//               padding: const EdgeInsets.symmetric(vertical: 12),
//             ),
//           ),
//           const SizedBox(height: 24),
//           const Divider(),
//           const SizedBox(height: 8),
//           // Teks yang berubah statusnya
//           Center(
//             child: Text(
//               'Status: $_statusMessage',
//               style: const TextStyle(fontStyle: FontStyle.italic),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // --- 4. Tab Sorotan (Page View) ---
// class FeaturedTab extends StatelessWidget {
//   const FeaturedTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final PageController controller = PageController();

//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             'Postingan Sorotan Anda',
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//         ),
//         const Text('Geser untuk melihat postingan terbaik Anda'),
//         const SizedBox(height: 10),

//         // === REQUIREMENT: Page view ===
//         Expanded(
//           child: PageView(
//             controller: controller,
//             children: <Widget>[
//               _buildFeaturedPage(
//                 'Cara Belajar Flutter dalam 30 Hari',
//                 Colors.purple[100]!,
//               ),
//               _buildFeaturedPage(
//                 'Mengapa State Management Penting?',
//                 Colors.blue[100]!,
//               ),
//               _buildFeaturedPage(
//                 'Panduan Lengkap Layout Widget',
//                 Colors.green[100]!,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildFeaturedPage(String title, Color color) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Center(
//         child: Text(
//           title,
//           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
