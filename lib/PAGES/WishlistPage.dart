import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';
import 'package:minimalecommerce/CONFIGURATION/Component.dart';
import 'package:minimalecommerce/CONFIGURATION/configuration.dart';
import 'package:minimalecommerce/PAGES/CheckOut.dart';

class CartItem {
  final String name;
  final double price;
  final double? originalPrice;
  final String? discount;
  final String imageUrl;
  Map<String, String>? variants;
  bool isSelected;
  bool isFavorite;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.originalPrice,
    this.discount,
    required this.imageUrl,
    this.variants,
    this.isSelected = false,
    this.isFavorite = false,
    this.quantity = 1,
  });

  double get total => price * quantity;
}

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'IDR ',
    decimalDigits: 0,
  );

  List<CartItem> cartItems = [
    CartItem(
      name: 'Apple Watch Ultra 2 with Ocean Band',
      price: 15999000,
      imageUrl: 'assets/images/watch.png',
    ),
    CartItem(
      name: 'AirPods Pro 2nd generation with USB-C',
      price: 3499000,
      originalPrice: 4299000,
      discount: '10% off',
      imageUrl: 'assets/images/airpods.jpg',
      isSelected: true,
    ),
    CartItem(
      name: 'Adicolor Neuclassics Men\'s Hoodie',
      price: 1500000,
      imageUrl: 'assets/images/hoodie.jpg',
      variants: {'color': 'Black', 'size': 'M'},
    ),
    CartItem(
      name: 'NBA Bulls Men\'s Jogger',
      price: 391300,
      originalPrice: 559000,
      discount: '7% off',
      imageUrl: 'assets/images/jogger.jpg',
      variants: {'color': 'Grey', 'size': 'M'},
    ),
    CartItem(
      name: 'NBA Suns Men\'s Hoodie',
      price: 3499000,
      imageUrl: 'assets/images/suns_hoodie.png',
      variants: {'color': 'Purple', 'size': 'L'},
    ),
  ];

  bool selectAll = false;

  double get totalPrice => cartItems
      .where((item) => item.isSelected)
      .fold(0, (sum, item) => sum + item.total);

  int get selectedItemCount =>
      cartItems.where((item) => item.isSelected).length;

  final Map<String, List<String>> variantOptions = {
    'color': ['Black', 'Grey', 'Purple', 'Red', 'Blue', 'White'],
    'size': ['S', 'M', 'L', 'XL', 'XXL'],
  };

  void _showVariantDialog(CartItem item, String variantType) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[200]!),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    radius: 20,
                    child: Icon(
                      variantType == 'color' ? Icons.palette : Icons.straighten,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Select ${variantType.capitalize()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: variantOptions[variantType]!.length,
                itemBuilder: (context, index) {
                  final option = variantOptions[variantType]![index];
                  final isSelected = item.variants?[variantType] == option;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (item.variants == null) {
                          item.variants = {};
                        }
                        item.variants![variantType] = option;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Warna.Primary.withOpacity(0.1) : null,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[200]!),
                        ),
                      ),
                      child: Row(
                        children: [
                          if (variantType == 'color')
                            Container(
                              width: 24,
                              height: 24,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: _getColor(option),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                            ),
                          Text(
                            option,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color:
                                  isSelected ? Warna.TextBold : Colors.black87,
                            ),
                          ),
                          const Spacer(),
                          if (isSelected)
                            Icon(
                              Icons.check_circle,
                              color: Warna.Primary,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'black':
        return Colors.black;
      case 'grey':
        return Colors.grey;
      case 'purple':
        return Colors.purple;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'white':
        return Colors.white;
      default:
        return Colors.grey;
    }
  }

  Widget _buildVariantChip(CartItem item, String variantType) {
    return GestureDetector(
      onTap: () => _showVariantDialog(item, variantType),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Warna.Primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              variantType == 'color' ? Icons.palette : Icons.straighten,
              size: 16,
              color: Warna.Primary.withOpacity(0.9),
            ),
            const SizedBox(width: 6),
            Text(
              '${variantType.capitalize()}: ${item.variants?[variantType] ?? 'Select'}',
              style: TextStyle(
                color: Warna.TextBold,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down,
              size: 16,
              color: Warna.Primary.withOpacity(0.9),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVariantsSection(CartItem item) {
    if (item.variants == null) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: item.variants!.keys.map((variantType) {
        return _buildVariantChip(item, variantType);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna.BG,
      appBar: AppBarComponent(),
      drawer: DrawerComponent(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 24,
                                child: Checkbox(
                                  fillColor: WidgetStatePropertyAll(
                                    Warna.PrimaryDark,
                                  ),
                                  hoverColor: Warna.Primary,
                                  overlayColor: WidgetStatePropertyAll(
                                    Warna.Primary.withOpacity(0.3),
                                  ),
                                  value: item.isSelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      item.isSelected = value ?? false;
                                      _updateSelectAll();
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(item.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item.name,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              height: 1.2,
                                              fontFamily: 'Nunito',
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: 20,
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          icon: Icon(
                                            item.isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: item.isFavorite
                                                ? Colors.red
                                                : Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              item.isFavorite =
                                                  !item.isFavorite;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    if (item.variants != null) ...[
                                      const SizedBox(height: 8),
                                      _buildVariantsSection(item),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const SizedBox(width: 32),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currencyFormatter.format(item.price),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                    if (item.originalPrice != null)
                                      Text(
                                        currencyFormatter
                                            .format(item.originalPrice),
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey[500],
                                          fontSize: 12,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (item.discount != null)
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red[50],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    item.discount!,
                                    style: TextStyle(
                                      color: Colors.red[400],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        if (item.quantity > 1) {
                                          setState(() {
                                            item.quantity--;
                                          });
                                        }
                                      },
                                      style: IconButton.styleFrom(
                                        padding: const EdgeInsets.all(8),
                                      ),
                                    ),
                                    Container(
                                      constraints: const BoxConstraints(
                                        minWidth: 40,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${item.quantity}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          item.quantity++;
                                        });
                                      },
                                      style: IconButton.styleFrom(
                                        padding: const EdgeInsets.all(8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: selectAll,
                          onChanged: (bool? value) {
                            setState(() {
                              selectAll = value ?? false;
                              for (var item in cartItems) {
                                item.isSelected = selectAll;
                              }
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Select All',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            currencyFormatter.format(totalPrice),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Warna.TextBold,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CheckoutScreen()), // Navigasi ke SearchPage`
                        );
                        // Handle checkout
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Warna.Primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add to Chart (${selectedItemCount} items)',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          Icon(
                            TablerIcons.chevron_right,
                            size: 22,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  void _updateSelectAll() {
    setState(() {
      selectAll = cartItems.every((item) => item.isSelected);
    });
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
