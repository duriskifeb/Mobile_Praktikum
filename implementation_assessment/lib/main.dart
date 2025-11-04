import 'package:flutter/material.dart';

//ini untuk main
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Blog',
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const BlogHomePage(),
    );
  }
}

//halamam Utama atau StateFulWidget
class BlogHomePage extends StatefulWidget {
  const BlogHomePage({super.key});

  @override
  State<BlogHomePage> createState() => _BlogHomePageState();
}

class _BlogHomePageState extends State<BlogHomePage> {
  int _selectIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardTab(),
    PostTab(),
    InteractionTab(),
    FeaturedTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Penulis')),

      //== INI Buat Drawer kak ==
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountEmail: const Text('Rizky'),
              accountName: const Text('rizky.nakal@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'R',
                  style: TextStyle(fontSize: 40.0, color: Colors.indigo),
                ),
              ),
              decoration: const BoxDecoration(color: Colors.indigoAccent),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile Saya'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan'),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log-out'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      // ==Tab View==
      body: IndexedStack(index: _selectIndex, children: _widgetOptions),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Postingan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Interaksi'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Sorotan'),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}

//1 DashboardTab()
class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Selamat Datang Rizky'),
          const Text('Ini adalah ringkasan stastistik blog anda'),
          const SizedBox(height: 24),
          Text(
            'Stakstistik Bulan Ini',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn('Postingan', '25'),
                _buildStatColumn('Dilihat', '25'),
                _buildStatColumn('Suka', '25'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //helper widget
  Widget _buildStatColumn(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}

// 2. TabPoatingan
class PostTab extends StatefulWidget {
  const PostTab({super.key});

  @override
  State<PostTab> createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> {
  bool _isGridView = false;
  final List<String> posts = List.generate(
    15,
    (index) => 'Postingan Blog #${index + 1}',
  );

  void _toggleView() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Semua Postingan Anda'),
              IconButton(
                icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view),
                onPressed: _toggleView,
                tooltip: 'Ubah Tampilan',
              ),
            ],
          ),
        ),
        //ini buat list view dan grid view
        Expanded(child: _isGridView ? _buildGridView() : _buildListView()),
      ],
    );
  }

  //widget untuk ListView
  Widget _buildListView() {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            leading: const Icon(Icons.article_outlined),
            title: Text(posts[index]),
            subtitle: const Text('Di Publikasikan: 4 November 2025'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          ),
        );
      },
    );
  }

  //Widget untuk GridView
  Widget _buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(8),
      children: posts.map((post) {
        return Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                  'https://placehold.co/200x200/E1BEE7/000000?text=${Uri.encodeComponent(post)}',
                ),
                fit: BoxFit.cover,
                onError: (error, stackTrace) {},
              ),
            ),
            // Pengembalian jika gambarnya gagal!
            child: Image.network(
              'https://placehold.co/200x200/E1BEE7/000000?text=${Uri.encodeComponent(post)}',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Center(child: Text(post, textAlign: TextAlign.center)),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// 3. Tab Action button dl..
class InteractionTab extends StatefulWidget {
  const InteractionTab({super.key});

  @override
  State<InteractionTab> createState() => _InteractionTabState();
}

class _InteractionTabState extends State<InteractionTab> {
  String _statusMesseage = 'Belum ada aksi!';

  void _publishPost() {
    setState(() {
      _statusMesseage = 'Postingan anda berhasil di Publikasikan';
    });
    //memanggil snackbar setelah state nya berubah
    _showSnackBar();
  }

  //menampilkan SnackBar
  void _showSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Berhasill! Postingan anda sudah di post!'),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  //menampilkan Show Dialog
  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi hapus'),
          content: const Text('Apakah anda yakin ingin di hapus?'),
          actions: [
            TextButton(
              child: const Text('Batal'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Hapus'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _statusMesseage = 'Draf telah dihapus.';
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Tulis Postingan Cepat',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Judul Postingan',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Isi postingan...',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
          const SizedBox(height: 20),
          // Tombol 1: Publish (Click & Change State, Show Snackbar)
          ElevatedButton.icon(
            icon: const Icon(Icons.publish),
            label: const Text('Publikasikan'),
            onPressed: _publishPost,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
          const SizedBox(height: 10),
          // Tombol 2: Hapus (Show Dialog)
          ElevatedButton.icon(
            icon: const Icon(Icons.delete_outline),
            label: const Text('Hapus Draf'),
            onPressed: _showDeleteDialog,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[100],
              foregroundColor: Colors.red[900],
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 8),
          // Teks yang berubah statusnya
          Center(
            child: Text(
              'Status: $_statusMesseage',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}

// 4. Tab Sorotan
class FeaturedTab extends StatelessWidget {
  const FeaturedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Postingan Sorotan Anda',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Text('Geser Untuk Melihat Postingan wapikmu'),
        const SizedBox(height: 10),

        //PageView
        Expanded(
          child: PageView(
            controller: controller,
            children: <Widget>[
              buildFeaturedPage(
                'cara menulis TA ndang lulus',
                Colors.purple[100]!,
              ),
              buildFeaturedPage(
                'cara menulis buku Agama agar menjadi Gus',
                Colors.purple[100]!,
              ),
              buildFeaturedPage(
                'cara menulis pahala biar jadi anak baik',
                Colors.purple[100]!,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFeaturedPage(String title, Color color) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
