import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(), // Set SearchPage as the home page for testing
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Find you needed...',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Popular Search Section
              Text(
                'Popular Search',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _popularSearchButton('Fossil Watch'),
                  _popularSearchButton('Iphone 14 Pro'),
                  _popularSearchButton('Gaming Chair'),
                  _popularSearchButton('New Balance'),
                ],
              ),
              SizedBox(height: 20),
              // Recommend for You Section
              Text(
                'Recommend for You',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
                children: [
                  _recommendCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    title: 'Uniqlo Basic T-shirt Oversized White',
                    price: 'IDR 200.000',
                    location: 'Surabaya',
                    rating: '4.9',
                    sold: '518',
                  ),
                  _recommendCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    title: 'New Balance 550 Men\'s Sneakers Shoes - Beige',
                    price: 'IDR 1.792.650',
                    location: 'Malang',
                    rating: '4.9',
                    sold: '814',
                    discount: '15% off',
                  ),
                  _recommendCard(
                    imageUrl:
                        'https://via.placeholder.com/150', // Replace with actual image URL
                    title: 'Apple Watch Ultra 2 with Alpine Loop',
                    price: 'IDR 9.999.000',
                    location: '',
                    rating: '4.8',
                    sold: '320',
                  ),
                  _recommendCard(
                    imageUrl:
                        'https://via.placeholder.com/150', // Replace with actual image URL
                    title: 'Nike Dri-FIT Academy Woven',
                    price: 'IDR 600.000',
                    location: '',
                    rating: '',
                    sold: '',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _popularSearchButton(String title) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey[300]!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(title, style: TextStyle(color: Colors.black)),
    );
  }

  Widget _recommendCard({
    required String imageUrl,
    required String title,
    required String price,
    required String location,
    String? rating,
    String? sold,
    String? discount,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
              if (discount != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      discount,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
                SizedBox(height: 4),
                Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                if (location.isNotEmpty) ...[
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(location, style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
                if (rating != null && sold != null) ...[
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.orange),
                      SizedBox(width: 4),
                      Text('$rating · $sold sold', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
