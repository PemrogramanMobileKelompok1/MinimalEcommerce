import 'package:flutter/material.dart';

class DetailProductPage extends StatefulWidget {
  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detail Product',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Membuat teks berada di tengah
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Gambar produk menggunakan PageView
              SizedBox(
                height: screenHeight * 0.35, // Responsif terhadap tinggi layar
                child: PageView(
                  children: [
                    Image.network(
                      'https://cdnpro.eraspace.com/media/catalog/product/i/p/iphone_14_blue_1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              // Info Produk
              const SizedBox(height: 16),
              Text(
                'iPhone 14 Pro Max 256GB Blue',
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.05, // Responsif terhadap lebar layar
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Info Produk lainnya
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'IDR 22.229.000',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'IDR 23.229.000',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '5% off',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24), // Jarak antara harga dan deskripsi
              Text(
                'Description Product',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Memotret detail menakjubkan dengan kamera Utama 48 MP. Nikmati iPhone dalam cara yang sepenuhnya baru dengan layar yang Selalu Aktif dan Dynamic...',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 24),

              // Pilihan Tipe
              Text(
                'Type',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  ChoiceChip(
                    label: const Text('Wi-fi'),
                    selected: true,
                    onSelected: (value) {},
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('Wi-fi + Cellular'),
                    selected: false,
                    onSelected: (value) {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 16), // Mengangkat tombol ke atas
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Latar belakang putih
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12), // Sudut melengkung seragam
                    side: const BorderSide(
                      color: Color.fromARGB(
                          255, 255, 144, 75), // Border warna oranye
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_cart_outlined, // Ikon troli
                      color: Colors.black, // Warna ikon hitam
                    ),
                    SizedBox(width: 8), // Memberikan jarak antara ikon dan teks
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.black, // Teks berwarna hitam
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 255, 144, 75), // Latar belakang oranye
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12), // Sudut melengkung seragam
                  ),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    color: Colors.white, // Teks putih
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
