import 'package:flutter/material.dart';
import 'schedule_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    SchedulePage(),
    NotificationsPage(),
    SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 1 // Cek jika halaman SchedulePage aktif
          ? PreferredSize(
        preferredSize: Size.fromHeight(0), // Tinggi AppBar 0
        child: SizedBox.shrink(), // Widget kosong
      )
          : AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu_outlined),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Burger menu clicked!")),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.switch_account_sharp),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Profile clicked!")),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_sharp), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.circle_notifications), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.manage_search), label: ""),
        ],
        selectedItemColor: Colors.blueGrey[600],
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

// Konten untuk Tab Home
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Hi!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Have a great day!",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Mengatur posisi ke kiri
            children: [
              Wrap(
                spacing: 10, // Jarak horizontal antar Chip
                runSpacing: 10, // Jarak vertikal jika Chip berpindah baris
                children: [
                  ActionChip(
                    label: Text("my task"),
                    backgroundColor: Colors.blueGrey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("my task clicked!")),
                      );
                    },
                  ),
                  ActionChip(
                    label: Text("Project"),
                    backgroundColor: Colors.blueGrey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Project clicked!")),
                      );
                    },
                  ),
                  ActionChip(
                    label: Text("Note"),
                    backgroundColor: Colors.blueGrey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Note clicked!")),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 20),

          // Geser Cards
          SizedBox(
            height: 350, // Tinggi untuk menampilkan kartu sepenuhnya
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.6), // Tampilan sebagian kartu berikutnya
              itemCount: 3,
              itemBuilder: (context, index) {
                final cardData = [
                  {
                    "title": "Mobile Programming",
                    "subtitle": "UTS",
                    "clock": "08.00",
                    "date": "23 November 2024",
                    "color": Colors.blueGrey[500],
                    "icon": Icons.code_outlined,
                  },
                  {
                    "title": "Banda Neira",
                    "subtitle": "Holiday",
                    "clock": "06.00",
                    "date": "20 Oktober 2024",
                    "color": Colors.blueGrey[600],
                    "icon": Icons.beach_access_rounded,
                  },
                  {
                    "title": "Group Wok",
                    "subtitle": "Progress",
                    "clock": "08.00",
                    "date": "7 Days ago",
                    "color": Colors.blueGrey[700],
                    "icon": Icons.group,
                  },
                ];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _buildCard(
                    title: cardData[index]["title"] as String,
                    subtitle: cardData[index]["subtitle"] as String,
                    clock: cardData[index]["clock"] as String,
                    date: cardData[index]["date"] as String,
                    color: cardData[index]["color"] as Color,
                    icon: cardData[index]["icon"] as IconData,
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 20),
          Text(
            "Progress",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.task_rounded, color: Colors.blueGrey[800]),
              title: Text("UTS CRM"),
              subtitle: Text("4 days ago"),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Selected: $value")),
                  );
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(value: "Edit", child: Text("Edit")),
                  PopupMenuItem(value: "Delete", child: Text("Delete")),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.close, color: Colors.grey[700]),
              title: Text("Checkout 11.11"),
              subtitle: Text("6 Days ago"),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Selected: $value")),
                  );
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(value: "Edit", child: Text("Edit")),
                  PopupMenuItem(value: "Delete", child: Text("Delete")),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.close, color: Colors.red),
              title: Text("Group Work"),
              subtitle: Text("3 days ago"),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Selected: $value")),
                  );
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(value: "Edit", child: Text("Edit")),
                  PopupMenuItem(value: "Delete", child: Text("Delete")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCard({
  required String title,
  required String subtitle,
  required String clock,
  required String date,
  required Color color,
  required IconData icon,
}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 4, // Tambahkan shadow untuk efek 3D
    color: color,
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      width: 50, // Lebar tetap
      height: 100, // Tinggi lebih panjang
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.grey),
          SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            clock,
            style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            date,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

// Konten untuk Tab Notifikasi
class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Notifications", style: TextStyle(fontSize: 18)),
    );
  }
}

// Konten untuk Tab Pencarian
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Search", style: TextStyle(fontSize: 18)),
    );
  }
}
