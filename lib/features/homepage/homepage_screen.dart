// lib/features/homepage/homepage_screen.dart
import 'package:cerina/features/homepage/widgets/at_section.dart';
import 'package:flutter/material.dart';
import 'data/homepage_data.dart';
import 'widgets/first_container.dart';
import 'widgets/second_container.dart';
import 'widgets/education_section.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final data = HomepageData.getData();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.pink[400],
            expandedHeight: screenSize.height * 0.02,
            floating: true,
            pinned: false,
            title: Row(
              children: [
                Image.asset(
                  'assets/logos/CerinaLogo-Landscape.png',
                  width: screenSize.width * 0.20,
                  height: screenSize.width * 0.20,
                  color: Colors.white,
                ),
                SizedBox(width: screenSize.width * 0.02),
              ],
            ),
            actions: [
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'Logout') {
                    print('Logged out');
                  }
                },
                icon: const Icon(Icons.more_vert, color: Colors.white),
                color: Colors.white,
                itemBuilder: (context) => [
                  const PopupMenuItem<String>(
                    value: 'Profile',
                    child:
                        Text('Profile', style: TextStyle(color: Colors.black)),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Setting',
                    child:
                        Text('Setting', style: TextStyle(color: Colors.black)),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Logout',
                    child:
                        Text('Logout', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: screenSize.height * 0.12, // pinkHeight
                    color: Colors.pink[400],
                  ),
                  Positioned(
                    top: (screenSize.height * 0.12) -
                        ((screenSize.height * 0.22) / 2),
                    left: screenSize.width * 0.05,
                    right: screenSize.width * 0.05,
                    child: FirstContainer(data: data),
                  ),
                ],
              ),
              SizedBox(
                  height: (screenSize.height * 0.23) / 2 +
                      (screenSize.width * 0.04)),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
                child: Column(
                  children: [
                    SecondContainer(data: data),
                    SizedBox(height: screenSize.height * 0.03),
                    EducationSection(data: data),
                    SizedBox(height: screenSize.height * 0.03),
                    AtSection(data: data),
                    SizedBox(height: screenSize.height * 0.03),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
