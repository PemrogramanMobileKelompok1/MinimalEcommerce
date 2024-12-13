import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../CONFIGURATION/configuration.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Warna.BG,

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Gradient Background
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Warna.Primary,
                          Warna.Primary.withOpacity(0.8),
                          Warna.Secondary.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                  // Decorative Pattern
                  CustomPaint(
                    painter: CirclePatternPainter(),
                  ),
                  // Profile Info
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 60,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // Profile Image Container
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 15,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage(
                                    'assets/images/profile_image.jpg'),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            // Camera Button
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Warna.Primary,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    // Add logic to change profile image
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Roan Atkinson',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 2),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Custom AppBar Actions
            actions: [
              IconButton(
                icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  // Handle settings
                },
              ),
              IconButton(
                icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  // Handle notifications
                },
              ),
              SizedBox(width: 8),
            ],
          ),
          // Rest of the content remains the same
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Warna.Primary.withOpacity(0.1),
                          Warna.Primary.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Summary',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Warna.TextBold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildOrderStatus(
                                'Pending',
                                '5',
                                Warna.Secondary,
                                Icons.access_time,
                              ),
                            ),
                            Expanded(
                              child: _buildOrderStatus(
                                'Delivered',
                                '12',
                                Warna.Success,
                                Icons.check_circle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildOrderStatus(
                                'Processing',
                                '3',
                                Warna.Primary,
                                Icons.rotate_right,
                              ),
                            ),
                            Expanded(
                              child: _buildOrderStatus(
                                'Canceled',
                                '2',
                                Colors.red,
                                Icons.cancel,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                _buildSection(
                  'Quick Actions',
                  [
                    _buildActionTile(
                      icon: Icons.favorite,
                      color: Colors.pink,
                      title: 'Wishlist',
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '8 items',
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    _buildActionTile(
                      icon: Icons.support_agent,
                      color: Warna.PrimaryDark,
                      title: 'Support',
                      subtitle: 'Get help with your orders',
                    ),
                  ],
                ),
                _buildSection(
                  'Account Settings',
                  [
                    _buildActionTile(
                      icon: Icons.edit,
                      color: Warna.Primary,
                      title: 'Edit Profile',
                      subtitle: 'Update your personal information',
                    ),
                    _buildActionTile(
                      icon: Icons.location_on,
                      color: Warna.Secondary,
                      title: 'Addresses',
                      subtitle: 'Manage delivery addresses',
                    ),
                    _buildActionTile(
                      icon: Icons.lock,
                      color: Warna.TextNormal,
                      title: 'Security',
                      subtitle: 'Change password and security settings',
                    ),
                    _buildActionTile(
                      icon: Icons.logout,
                      color: Colors.red,
                      title: 'Logout',
                      subtitle: 'Sign out from your account',
                    ),

                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom Painter for decorative pattern
  Widget _buildOrderStatus(
    String title,
    String count,
    Color color,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            count,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Warna.TextNormal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Warna.TextBold,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required Color color,
    required String title,
    String? subtitle,
    Widget? trailing,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Warna.TextBold,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                color: Warna.TextNormal,
                fontSize: 14,
              ),
            )
          : null,
      trailing: trailing ??
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Warna.TextNormal,
          ),
      onTap: () {
        // Handle action
      },
    );
  }
}

class CirclePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.3),
      40,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.2),
      30,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.5),
      25,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
