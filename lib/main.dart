import 'package:flutter/material.dart';

void main() {
  runApp(HouseBuyingApp());
}

// Stateless Widget for the Home Page
class HouseBuyingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'House Buying App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/houseList': (context) => HouseListPage(),
      },
    );
  }
}

// Stateful Widget for Home Page with gradient background and modern shapes
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeDream'),
        backgroundColor: Colors.blue.shade800,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                ),
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Jelajahi Rumah'),
              onTap: () {
                Navigator.pushNamed(context, '/houseList');
              },
            ),
            ListTile(
              title: Text('Pengaturan'),
              onTap: () {
                // Add settings functionality
              },
            ),
            ListTile(
              title: Text('Bantuan'),
              onTap: () {
                // Add help functionality
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade100, Colors.purple.shade100],
              ),
            ),
          ),
          // Abstract modern shapes
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue.shade300.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purple.shade300.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Temukan Rumah Impian Anda!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/houseList');
                  },
                  child: Text('Jelajahi Rumah'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Stateless Widget for House List Page with dummy images from Picsum
class HouseListPage extends StatelessWidget {
  final List<Map<String, String>> houses = [
    {
      'name': 'Rumah Modern - Rp300.000.000',
      'image': 'https://picsum.photos/200/300?random=1',
    },
    {
      'name': 'Vila Mewah - Rp1.200.000.000',
      'image': 'https://picsum.photos/200/300?random=2',
    },
    {
      'name': 'Apartemen Cozy - Rp150.000.000',
      'image': 'https://picsum.photos/200/300?random=3',
    },
    {
      'name': 'Rumah Pantai - Rp500.000.000',
      'image': 'https://picsum.photos/200/300?random=4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rumah yang Tersedia'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Container(
        color: Colors.blue.shade50,
        child: ListView.builder(
          itemCount: houses.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Image.network(houses[index]['image']!),
                title: Text(houses[index]['name']!),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HouseDetailsPage(house: houses[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// Stateful Widget for House Details Page with scrollable content
class HouseDetailsPage extends StatefulWidget {
  final Map<String, String> house;

  HouseDetailsPage({required this.house});

  @override
  _HouseDetailsPageState createState() => _HouseDetailsPageState();
}

class _HouseDetailsPageState extends State<HouseDetailsPage> {
  bool _isInterested = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.house['name']!),
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.house['image']!),
            SizedBox(height: 10),
            Text(
              widget.house['name']!,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Deskripsi: Rumah ini adalah properti yang sangat bagus dengan fitur-fitur yang menakjubkan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.blue),
                SizedBox(width: 8),
                Text('Dekat dengan sekolah dan pusat perbelanjaan.', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            Text('Fasilitas:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.kitchen, color: Colors.blue),
                SizedBox(width: 8),
                Text('Dapur lengkap', style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.directions_car, color: Colors.blue),
                SizedBox(width: 8),
                Text('Parkir mobil', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            Text('Keunggulan:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, color: Colors.blue),
                SizedBox(width: 8),
                Text('Desain modern', style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.security, color: Colors.blue),
                SizedBox(width: 8),
                Text('Keamanan 24 jam', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Harga: Rp300.000.000\n\n',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Hubungi kami untuk informasi lebih lanjut dan jadwalkan kunjungan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isInterested = !_isInterested;
                });
              },
              child: Text(_isInterested ? 'Batal Tertarik' : 'Tertarik'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isInterested ? Colors.green : Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
