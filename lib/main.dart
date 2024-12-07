import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:minimalecommerce/CONFIGURATION/configuration.dart';
import 'package:minimalecommerce/PAGES/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimal E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _userPages = [
    HomePage(), // Catatan
    Placeholder(), // Laporan
    Placeholder(), // Laporan
    Placeholder(), // Profile
  ];

  List<Widget> _getPages() {
    return _userPages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Warna.TextBold, // Warna latar belakang header
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pembukuan #1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Sunfish',
                        ),
                      ),
                      Icon(
                        TablerIcons.chevron_right,
                        color: Warna.Primary,
                      )
                    ],
                  ),
                  Text(
                    'Keperluan Pribadi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontFamily: 'JackInput',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Backup Data :',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'JackInput',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Warna.Primary,
                            borderRadius: BorderRadius.circular(9)),
                        child: Text(
                          'Active',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: 'JackInput',
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(TablerIcons.shopping_cart),
              title: Text(
                'Rencana Belanja',
                style: TextStyle(fontFamily: 'JackInput'),
              ),
              onTap: () {
                // Navigasi ke halaman Rencana Belanja
              },
            ),
            ListTile(
              leading: Icon(TablerIcons.receipt),
              title: Text(
                'Rekap Keuangan',
                style: TextStyle(fontFamily: 'JackInput'),
              ),
              onTap: () {
                // Navigasi ke halaman Rekap Keuangan
              },
            ),
            ListTile(
              leading: Icon(TablerIcons.settings),
              title: Text(
                'Pengaturan',
                style: TextStyle(fontFamily: 'JackInput'),
              ),
              onTap: () {
                // Navigasi ke halaman Pengaturan
              },
            ),
            ListTile(
              leading: Icon(TablerIcons.database_export),
              title: Text(
                'Backup & Restore',
                style: TextStyle(fontFamily: 'JackInput'),
              ),
              onTap: () {
                // Navigasi ke halaman Backup & Restore
              },
            ),
          ],
        ),
      ),
      body: _getPages()[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Warna.BG,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 65.0,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Change the page when an item is tapped
          });
        },
        items: <Widget>[
          Icon(
            TablerIcons.home,
            size: 30,
            color: Warna.PrimaryDark,
          ), // Catatan
          Icon(
            TablerIcons.heart,
            size: 30,
            color: Warna.PrimaryDark,
          ), // Grafi
          Icon(
            TablerIcons.file_text,
            size: 30,
            color: Warna.PrimaryDark,
          ), // Laporan
          Icon(
            TablerIcons.user,
            size: 30,
            color: Warna.PrimaryDark,
          ), // Profile
        ],
      ),
    );
  }
}
