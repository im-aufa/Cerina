import 'dart:ui'; // For BackdropFilter
import 'package:cerina/features/profile/profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:cerina/core/utils/responsive.dart'; // Adjust import path

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive();
    responsive.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
        title: const Center(
          child: Text(
            'Pengaturan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Logout') {
                print('Logged out');
              }
            },
            icon: const Icon(Icons.more_vert),
            color: Colors.white,
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'Profile',
                child: Text('Profile', style: TextStyle(color: Colors.black)),
              ),
              const PopupMenuItem<String>(
                value: 'Setting',
                child: Text('Setting', style: TextStyle(color: Colors.black)),
              ),
              const PopupMenuItem<String>(
                value: 'Logout',
                child: Text('Logout', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: responsive.height(2)), // Spacing below AppBar
          Center(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: responsive.width(40),
                  height: responsive.width(40),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.pink[400]!.withOpacity(0.3),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(color: Colors.transparent),
                  ),
                ),
                Positioned(
                  top: responsive.width(35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('Button 1 pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.pink[400],
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(responsive.width(4)),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: responsive.width(8),
                            vertical: responsive.height(2),
                          ),
                        ),
                        child: const Text(
                          'Button 1',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(width: responsive.width(5)),
                      ElevatedButton(
                        onPressed: () {
                          print('Button 2 pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.pink[400],
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(responsive.width(4)),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: responsive.width(8),
                            vertical: responsive.height(2),
                          ),
                        ),
                        child: const Text(
                          'Button 2',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/08.png'),
                ),
              ],
            ),
          ),
          SizedBox(height: responsive.height(8)), // Spacing below buttons
          Text(
            'Pengaturan Dasar',
            style: TextStyle(
              fontSize: responsive.fontSize(20),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: responsive.height(2)), // Spacing before long buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.width(5)),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const ProfileSetting(
                            user: null), // Fixed type mismatch
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(responsive.width(4)),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: responsive.height(2.5),
                      horizontal: responsive.width(6),
                    ),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person, size: responsive.fontSize(18)),
                          SizedBox(width: responsive.width(2)),
                          Text(
                            'Kelola Akun',
                            style: TextStyle(fontSize: responsive.fontSize(18)),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward, size: responsive.fontSize(18)),
                    ],
                  ),
                ),
                SizedBox(height: responsive.height(1)),
                ElevatedButton(
                  onPressed: () {
                    print('Long Button 2 pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(responsive.width(4)),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: responsive.height(2.5),
                      horizontal: responsive.width(6),
                    ),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.message, size: responsive.fontSize(18)),
                          SizedBox(width: responsive.width(2)),
                          Text(
                            'Ubah Waktu Respons',
                            style: TextStyle(fontSize: responsive.fontSize(18)),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward, size: responsive.fontSize(18)),
                    ],
                  ),
                ),
                SizedBox(height: responsive.height(1)),
                ElevatedButton(
                  onPressed: () {
                    print('Long Button 3 pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(responsive.width(4)),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: responsive.height(2.5),
                      horizontal: responsive.width(6),
                    ),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.public, size: responsive.fontSize(18)),
                          SizedBox(width: responsive.width(2)),
                          Text(
                            'Layanan Pembaruan',
                            style: TextStyle(fontSize: responsive.fontSize(18)),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward, size: responsive.fontSize(18)),
                    ],
                  ),
                ),
                SizedBox(height: responsive.height(2)),
                Container(
                  padding: EdgeInsets.all(responsive.width(5)),
                  decoration: BoxDecoration(
                    color: Colors.grey[800], // Base greyish-black background
                    borderRadius: BorderRadius.circular(responsive.width(4)),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile_crown.png'),
                      fit: BoxFit.cover,
                      opacity: 0.5,
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: responsive.width(-7),
                        bottom: responsive.width(-5),
                        child: Opacity(
                          opacity: 0.7,
                          child: Image.asset(
                            'assets/images/profile_crown.png',
                            width: responsive.width(40),
                            height: responsive.width(40),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Premium',
                            style: TextStyle(
                              fontSize: responsive.fontSize(16),
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: responsive.height(0.5)),
                          Text(
                            'Dapatkan fitur tambahan dengan berlangganan',
                            style: TextStyle(
                              fontSize: responsive.fontSize(14),
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: responsive.height(1)),
                          ElevatedButton(
                            onPressed: () {
                              print('Pink Button pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink[400],
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(responsive.width(2)),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: responsive.height(1),
                                horizontal: responsive.width(3),
                              ),
                              minimumSize: Size(responsive.width(20), 0),
                            ),
                            child: const Text(
                              'Upgrade',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
