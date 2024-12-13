import 'package:flutter/material.dart';
import 'package:minimalecommerce/CONFIGURATION/configuration.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna.BG,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Warna.TextBold),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Icon(TablerIcons.search, color: Colors.grey),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Temukan Kebutuhan Anda...',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Nunito',
                      color: Color.fromARGB(255, 157, 157, 157),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          _buildActionIcon(
            TablerIcons.filter,
            onTap: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Popular Search Section
              Text(
                'Popular Search',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                  color: Warna.TextBold,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildPopularSearchButton('Fossil Watch'),
                  _buildPopularSearchButton('Iphone 14 Pro'),
                  _buildPopularSearchButton('Gaming Chair'),
                  _buildPopularSearchButton('New Balance'),
                ],
              ),
              SizedBox(height: 20),
              // Recommended for You Section
              Text(
                'Recommended for You',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                  color: Warna.TextBold,
                ),
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
                  _buildRecommendedCard(
                    imageUrl: 'https://d2bzx2vuetkzse.cloudfront.net/fit-in/0x450/images_without_background/c2be66c9-3f30-4881-8584-2ab48f0875e5.png',
                    title: 'Uniqlo Basic T-shirt Oversized White',
                    price: 'IDR 200.000',
                    location: 'Surabaya',
                    rating: '4.9',
                    sold: '518',
                  ),
                  _buildRecommendedCard(
                    imageUrl: 'https://cms.brnstc.de/product_images/2244x3072p/cpro/media/images/product/23/12/100158298211000_0_1702372465607.webp',
                    title: 'New Balance 550 Men\'s Sneakers Shoes - Beige',
                    price: 'IDR 1.792.650',
                    location: 'Malang',
                    rating: '4.9',
                    sold: '814',
                    discount: '15% off',
                  ),
                  _buildRecommendedCard(
                    imageUrl: 'https://m.media-amazon.com/images/I/81k6R2uh1JL._AC_SL1500_.jpg',
                    title: 'Apple Watch Ultra 2 with Alpine Loop',
                    price: 'IDR 9.999.000',
                    location: '',
                    rating: '4.8',
                    sold: '320',
                  ),
                  _buildRecommendedCard(
                    imageUrl: 'https://images.tokopedia.net/img/cache/700/OJWluG/2024/5/21/49c30f19-cf95-4ac4-ac86-db32e8539e22.jpg',
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

  Widget _buildActionIcon(IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
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

  Widget _buildPopularSearchButton(String title) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Warna.TextBold,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildRecommendedCard({
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
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if (discount != null)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      discount,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
                color: Warna.Primary,
              ),
            ),
          ),
          if (location.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(TablerIcons.map_pin, size: 14, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (rating != null && sold != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(Icons.star, size: 14, color: Colors.amber),
                  SizedBox(width: 4),
                  Text(
                    '$rating · $sold sold',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ],
              ),
            ),
          ],
          SizedBox(height: 8),
        ],
      ),
    );
  }
}