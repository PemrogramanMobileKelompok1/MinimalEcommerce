import 'package:flutter/material.dart';
import 'package:minimalecommerce/CONFIGURATION/configuration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckoutScreen(),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Checkout'),
        ),
        backgroundColor: Warna.Primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // Shipping Address Section
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: Colors.red),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Address',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('Jl. Rose No. 123 Block A, Cipete Sub District,'),
                          Text('Cilandak District, South Jakarta City, DKI Jakarta'),
                          Text('+62 874 3190 7115'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 16),
            // Product Details Section
            Row(
              children: [
                Image.network(
                  'assets/images/ipad.jpeg',
                  width: 60,
                  height: 60,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ipad Pro 6th Generation 11 Inch 2022',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text('Space Gray Colors, Wi-Fi Only, 256 GB', 
                      style: TextStyle(),),
                      Text('IDR 15.299.000',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Shipping Options Section
            // Shipping Options Section
              Text(
                'Select Shipping',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Express', style: TextStyle(fontSize: 16)),
                      Text('IDR 50.000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                 
                ],
                
              ),
               Text('Estimated arrived 9-10 june', style: TextStyle(fontSize: 16, color: Colors.grey),),
            SizedBox(height: 16),
            Divider(),
            // Payment Section
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.orange.withOpacity(0.1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.money, color: Colors.orange),
                              SizedBox(width: 8),
                              Text(
                                'Cash',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Pay cash when the medicine arrives at the destination.',
                            style: TextStyle(fontSize: 12, color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_balance, color: Colors.grey),
                              SizedBox(width: 8),
                              Text(
                                'Bank Transfer',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Log in to your online account and make payment.',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            // Total and Checkout Button
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Logika untuk checkout
                            print('Checkout pressed');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Warna.Primary,
                          ),
                          child: Text('Checkout'),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ],
            ),
            Text(
                'IDR 15.349.000',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}