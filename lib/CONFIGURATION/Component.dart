import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:minimalecommerce/CONFIGURATION/configuration.dart';
import 'package:minimalecommerce/PAGES/Chart.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* double screenWidth = MediaQuery.of(context).size.width; */
    double screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
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
    );
  }
}

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Text(
            'Minimal E-commerce',
            style: TextStyle(
              fontFamily: 'CampanaScript',
              fontSize: 30,
              color: Warna.TextBold,
            ),
          ),
        ],
      ),
      actions: [
        _buildActionIcon(
          TablerIcons.shopping_bag,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
        ),
        _buildActionIcon(TablerIcons.bell),
        const SizedBox(width: 5),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Widget _buildActionIcon(IconData icon, {VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap, // Aksi saat ikon ditekan
    child: Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color.fromARGB(221, 151, 151, 151),
          width: 1,
        ),
      ),
      child: Icon(icon, color: Warna.Primary),
    ),
  );
}
