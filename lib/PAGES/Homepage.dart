import 'package:flutter/material.dart';
import 'package:minimalecommerce/CONFIGURATION/configuration.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:minimalecommerce/PAGES/DetailProduct.dart';
import 'package:minimalecommerce/PAGES/search_page.dart';
import 'Chart.dart';

import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* MENU */
  final List<Map<String, dynamic>> menuItems = const [
    {'imagePath': 'assets/images/electronic.png', 'title': 'Electronic'},
    {'imagePath': 'assets/images/food.png', 'title': 'Food & Drink'},
    {'imagePath': 'assets/images/accesories.png', 'title': 'Accesories'},
    {'imagePath': 'assets/images/makeup.png', 'title': 'Makeup'},
    {'imagePath': 'assets/images/furniture.png', 'title': 'Furniture'},
    {'imagePath': 'assets/images/fashion.png', 'title': 'Fashion'},
    {'imagePath': 'assets/images/health.png', 'title': 'Health'},
  ];
  /* MENU */

  /* PRODUCT */
  final List<Map<String, dynamic>> products = [
    {
      "image":
          "https://cdnpro.eraspace.com/media/catalog/product/i/p/iphone_14_blue_1.jpg",
      "title": "Iphone 14 Pro Max",
      "description":
          "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Optio voluptatibus dolorem ab accusamus magnam magni numquam similique mollitia minima, fugiat quibusdam perferendis at delectus aperiam vitae iure corrupti, nihil consequatur?",
      "price": "\$1600",
      "rating": 4.5,
      "discount": "10% OFF"
    },
    {
      "image":
          "https://images-cdn.ubuy.co.in/650188aee584193d8350a66b-2022-apple-macbook-pro-laptop-with-m2.jpg",
      "title": "Macbook Pro M2",
      "description": "High quality and durable.",
      "price": "\$15",
      "rating": 4.0,
      "discount": "15% OFF"
    },
    {
      "image":
          "https://www.sony.co.id/image/9179835e50d48589408a5d9c54c5a990?fmt=pjpeg&wid=330&bgcolor=FFFFFF&bgc=FFFFFF",
      "title": "Sony DSC-WX500",
      "description": "Limited edition product.",
      "price": "\$20",
      "rating": 4.8,
      "discount": "20% OFF"
    },
    {
      "image":
          "https://cdn11.bigcommerce.com/s-itgb7ssiy1/images/stencil/500x659/products/190/585/LPD-Front-Elevated-2400-x-2400-compressed__41068.1681831162.png?c=1",
      "title": "Novation Launchpad Pro",
      "description": "Best seller this month.",
      "price": "\$150",
      "rating": 4.7,
      "discount": "10% OFF"
    },
  ];
  /* PRODUCT */

  @override
  Widget build(BuildContext context) {
    int endTime =
        DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60; // 1 jam

    return Scaffold(
      backgroundColor: Warna.BG,
      appBar: AppBar(
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
      ),
      drawer: const Drawer(),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          /* SEARCHBAR */
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchPage()), // Navigasi ke SearchPage
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(TablerIcons.search, color: Colors.grey),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Temukan Kebutuhan Anda...',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Nunito',
                      color: const Color.fromARGB(255, 157, 157, 157),
                    ),
                  ),
                ],
              ),
            ),
          ),
/* SEARCHBAR */

          const SizedBox(height: 10),
          /* LOKASI */
          _buildLocationRow(),
          /* LOKASI */
          const SizedBox(height: 10),
          /* MENU */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final menuItem = menuItems[index];
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('You selected ${menuItem['title']}')),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          shape: BoxShape.circle, // Bentuk bulat
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          menuItem['imagePath'], // Path gambar
                          width: 40, // Gambar lebih kecil
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                          height: 4), // Spasi antara circle dan title
                      Text(
                        menuItem['title'],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          /* MENU */
          SizedBox(
            height: 10,
          ),
          /* BANNER */
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 180, // Tinggi card
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage(
                    'assets/images/banner1.jpg'), // Gambar background
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4), // Posisi bayangan
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.3),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '12.12 Flash Sale!', // Title
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Up to 100% off on selected items.', // Description
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Navigating to Shop...')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Warna.Primary, // Warna tombol
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Tombol rounded
                      ),
                    ),
                    child: const Text(
                      'Shop Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'CampanaScript',
                          fontSize: 26),
                    ),
                  ),
                ],
              ),
            ),
          ),
          /* BANNER */
          SizedBox(
            height: 10,
          ),
          /* PRODUCT */
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title & Countdown
                    Row(
                      children: [
                        Text(
                          "Flash Sale",
                          style: TextStyle(
                              fontFamily: 'CampanaScript',
                              fontSize: 30,
                              color: Warna.TextBold,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Warna.Primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CountdownTimer(
                            endTime: endTime,
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    // See All Button
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Navigating to See All...")),
                        );
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 14,
                          color: Warna.TextBold,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Product GridView
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 item per baris
                  mainAxisSpacing: 10, // Jarak vertikal antar item
                  crossAxisSpacing: 10, // Jarak horizontal antar item
                  childAspectRatio:
                      0.7, // Proporsi lebar dan tinggi card (lebih tinggi)
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailProductPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Image with Discount Badge
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      product['image'],
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              // Discount Badge
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    product['discount'],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Product Title
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              product['title'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito',
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Product Description
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              product['description'],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Nunito',
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          // Product Rating
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                RatingBarIndicator(
                                  rating: product['rating'],
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 16.0,
                                  direction: Axis.horizontal,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  product['rating'].toString(),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          /* PRODUCT */
        ],
      ),
    );
  }
}

/* HELPER WIDGETS */
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

Widget _buildLocationRow() {
  return Row(
    children: [
      Icon(TablerIcons.map_pin_filled, color: Warna.Primary),
      const SizedBox(width: 5),
      Text(
        'Diantar ke ',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontFamily: 'Nunito',
          color: Warna.TextNormal,
        ),
      ),
      Flexible(
        child: Text(
          'Lhokseumawe, Jln Medan Banda Aceh, Buket Rata',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            color: Warna.TextBold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
