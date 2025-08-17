import 'dart:ui'; // For BackdropFilter
import 'package:cerina/features/profile/profile_setting.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Pengaturan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: screenSize.height * 0.02),
          Center(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: screenSize.width * 0.40,
                  height: screenSize.width * 0.40,
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
                  top: screenSize.width * 0.35,
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
                                BorderRadius.circular(screenSize.width * 0.04),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.08,
                            vertical: screenSize.height * 0.02,
                          ),
                        ),
                        child: const Text(
                          'Button 1',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(width: screenSize.width * 0.05),
                      ElevatedButton(
                        onPressed: () {
                          print('Button 2 pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.pink[400],
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(screenSize.width * 0.04),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.08,
                            vertical: screenSize.height * 0.02,
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
          SizedBox(height: screenSize.height * 0.08),
          Text(
            'Pengaturan Dasar',
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenSize.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProfileSetting(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(screenSize.width * 0.04),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenSize.height * 0.025,
                      horizontal: screenSize.width * 0.06,
                    ),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person),
                          SizedBox(width: screenSize.width * 0.02),
                          Text(
                            'Kelola Akun',
                            style: textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                ElevatedButton(
                  onPressed: () {
                    print('Long Button 2 pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(screenSize.width * 0.04),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenSize.height * 0.025,
                      horizontal: screenSize.width * 0.06,
                    ),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.message),
                          SizedBox(width: screenSize.width * 0.02),
                          Text(
                            'Ubah Waktu Respons',
                            style: textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                ElevatedButton(
                  onPressed: () {
                    print('Long Button 3 pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(screenSize.width * 0.04),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenSize.height * 0.025,
                      horizontal: screenSize.width * 0.06,
                    ),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.public),
                          SizedBox(width: screenSize.width * 0.02),
                          Text(
                            'Layanan Pembaruan',
                            style: textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                Container(
                  padding: EdgeInsets.all(screenSize.width * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius:
                        BorderRadius.circular(screenSize.width * 0.04),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: screenSize.width * -0.07,
                        bottom: screenSize.width * -0.05,
                        child: Opacity(
                          opacity: 0.7,
                          child: Image.asset(
                            'assets/images/profile_crown.png',
                            width: screenSize.width * 0.40,
                            height: screenSize.width * 0.40,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Premium',
                            style: textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.005),
                          Text(
                            'Dapatkan fitur tambahan dengan berlangganan',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[400],
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.01),
                          ElevatedButton(
                            onPressed: () {
                              print('Pink Button pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink[400],
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    screenSize.width * 0.02),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: screenSize.height * 0.01,
                                horizontal: screenSize.width * 0.03,
                              ),
                              minimumSize: Size(screenSize.width * 0.20, 0),
                            ),
                            child: Text(
                              'Upgrade',
                              style: textTheme.bodyMedium,
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
