// lib/features/homepage/homepage_screen.dart
import 'package:cerina/features/homepage/widgets/at_section.dart';
import 'package:flutter/material.dart';
import 'package:cerina/core/utils/responsive.dart';
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
    final responsive = Responsive();
    responsive.init(context);
    final data = HomepageData.getData();

    // SliverAppBar height when expanded
    final double appBarHeight = responsive.height(2); // ~10% ≈ 108px on 1080p

    // EducationSection: header + 2 cards + spacing
    final double educationSectionHeight =
        responsive.fontSize(16) + // Header approximation
            (2 * responsive.height(15)) + // Two cards
            responsive.height(1); // Spacing between cards

    // AtSection: header + 2 cards (135px each) + spacing
    final double atSectionHeight =
        responsive.fontSize(16) + // Header approximation
            (2 * 135) + // Two fixed-height cards
            responsive.height(1); // Spacing between cards

    // EducationSection start position (adjusted for SliverAppBar)
    final double educationStart = responsive.pinkHeight +
        (responsive.height(28) / 2) +
        responsive.height(8) +
        responsive.width(4);

    // AtSection starts right below EducationSection's second card
    final double atSectionTop = educationStart +
        responsive.fontSize(16) + // Header
        (2 * responsive.height(15)) + // Two cards
        responsive.height(1); // Spacing between cards

    final double totalContentHeight = appBarHeight + // SliverAppBar
        responsive.pinkHeight +
        responsive.height(25) + // FirstContainer
        responsive.height(18) + // SecondContainer
        responsive.height(2) + // EducationSection spacing
        educationSectionHeight +
        responsive.height(2) + // Spacing before AtSection
        atSectionHeight;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.pink[400],
            expandedHeight: appBarHeight, // Collapsible height
            floating: true, // Stays until fully scrolled
            pinned: false, // Collapses when scrolled
            title: Row(
              children: [
                Image.asset(
                  'assets/logos/CerinaLogo-Landscape.png',
                  width: responsive.width(20),
                  height: responsive.width(20),
                  color: Colors.white,
                ),
                SizedBox(width: responsive.width(2)),
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: totalContentHeight -
                  appBarHeight, // Subtract app bar height from content
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: responsive.pinkHeight,
                        color: Colors.pink[400],
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  FirstContainer(
                    data: data,
                    topPosition:
                        responsive.pinkHeight - (responsive.height(22) / 2),
                  ),
                  SecondContainer(
                    data: data,
                    topPosition: responsive.pinkHeight +
                        (responsive.height(28) / 2) +
                        responsive.width(2),
                  ),
                  EducationSection(
                    data: data,
                    topPosition: responsive.pinkHeight +
                        (responsive.height(28) / 2) +
                        responsive.height(18) +
                        responsive.width(4),
                  ),
                  AtSection(
                    data: data,
                    topPosition: atSectionTop,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
