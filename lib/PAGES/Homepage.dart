import 'package:flutter/material.dart';
import 'package:minimalecommerce/CONFIGURATION/configuration.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna.BG,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('Minimal Shop'),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
              border: Border.all(
                  color: const Color.fromARGB(221, 151, 151, 151), width: 1),
            ),
            child: Icon(
              TablerIcons.shopping_bag,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
              border: Border.all(
                  color: const Color.fromARGB(221, 151, 151, 151), width: 1),
            ),
            child: Icon(
              TablerIcons.bell,
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      drawer: Drawer(),
      body: Text(''),
    );
  }
}
