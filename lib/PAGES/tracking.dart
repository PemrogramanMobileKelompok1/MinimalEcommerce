import 'package:flutter/material.dart';

void main() {
  runApp(TrackingApp());
}

class TrackingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrackingDetailsPage(),
    );
  }
}

class TrackingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking Details'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Details
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage('https://via.placeholder.com/150'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'iPad Pro 6th Generation: 11 Inch 2022',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Space Gray Color, Wi-Fi Only, 256 GB',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'ID ORDER: 1748HAFFJBC',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 16),

            // Address Details
            Text(
              'Shipment Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.orange),
              title: Text('Guntur District, West Jakarta City, DKI Jakarta 12410 Indonesia'),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.orange),
              title: Text(
                  'Jl. Rawa No. 123 Block A, Cipete Sub-District, Cilandak District, South Jakarta City, DKI Jakarta 12410 Indonesia'),
            ),
            ListTile(
              leading: Icon(Icons.local_shipping, color: Colors.orange),
              title: Text('3.5 kg'),
            ),

            SizedBox(height: 16),

            // Tracking Timeline
            Expanded(
              child: ListView(
                children: [
                  TimelineTile(
                    title: 'Being Packaged',
                    subtitle: 'Your order is being packaged',
                    time: '8:00 AM',
                    isActive: true,
                  ),
                  TimelineTile(
                    title: 'Orders in Delivery',
                    subtitle: 'Your order is on the way',
                    time: '9:30 AM',
                    isActive: true,
                  ),
                  TimelineTile(
                    title: 'Orders in Delivery',
                    subtitle: 'Your order is closer to your location',
                    time: '11:00 AM',
                    isActive: false,
                  ),
                  TimelineTile(
                    title: 'Towards Destination',
                    subtitle: 'Your order is reaching its destination',
                    time: '12:30 PM',
                    isActive: false,
                  ),
                ],
              ),
            ),

            // Button
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Ask Customer Support'),
            ),
          ],
        ),
      ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool isActive;

  const TimelineTile({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? Colors.orange : Colors.grey,
              ),
            ),
            Container(
              width: 2,
              height: 50,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.black : Colors.grey,
                ),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 4),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
