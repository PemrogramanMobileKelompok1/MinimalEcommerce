import 'package:flutter/material.dart';
import 'cart.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
        tooltip: 'Go to Cart',
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
