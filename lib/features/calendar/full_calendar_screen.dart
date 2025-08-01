import 'package:flutter/material.dart';
import 'package:cerina/core/utils/responsive.dart'; // Adjust import path

class FullCalendarScreen extends StatelessWidget {
  const FullCalendarScreen({super.key});

  // Generate a 7x6 grid of dates centered around today
  List<Map<String, dynamic>> _getCalendarData() {
    final now = DateTime.now();
    // Start from the beginning of the current month
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    // Find the first Monday before or on the 1st
    int daysToSubtract = (startOfMonth.weekday - 1) % 7;
    DateTime startDate = startOfMonth.subtract(Duration(days: daysToSubtract));

    List<Map<String, dynamic>> calendarData = [];
    DateTime currentDate = startDate;

    // Generate exactly 42 days (7x6 grid)
    for (int i = 0; i < 42; i++) {
      calendarData.add({
        'date': currentDate.day.toString(),
        'weekday': currentDate.weekday, // 1 = Monday, 7 = Sunday
        'isCurrentDay': currentDate.day == now.day &&
            currentDate.month == now.month &&
            currentDate.year == now.year,
        'month': currentDate.month, // Track the month for color
        'year': currentDate.year, // Track the year
      });
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return calendarData;
  }

  // Get day initial from weekday number
  String _getDayInitial(int weekday) {
    switch (weekday) {
      case 1:
        return 'M';
      case 2:
        return 'T';
      case 3:
        return 'W';
      case 4:
        return 'T';
      case 5:
        return 'F';
      case 6:
        return 'S';
      case 7:
        return 'S';
      default:
        return '';
    }
  }

  // Format current month and year (e.g., "March 2025")
  String _getMonthYearString() {
    final now = DateTime.now();
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${months[now.month]} ${now.year}';
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive();
    responsive.init(context);

    final calendarData = _getCalendarData();
    final now = DateTime.now();
    final currentMonth = now.month;
    final currentYear = now.year;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/logos/CerinaLogo-Landscape.png',
              width: responsive.width(20),
              height: responsive.width(20),
            ),
            SizedBox(width: responsive.width(2)),
          ],
        ),
        centerTitle: true, // Center the title
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Logout') {
                print('Logged out');
              }
            },
            icon: const Icon(Icons.more_vert),
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
          // Title and Month/Year Indicator with Icon
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.width(5),
              vertical: responsive.height(2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kalender',
                  style: TextStyle(
                    fontSize: responsive.fontSize(25),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: responsive.height(1)),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: responsive.fontSize(16),
                      color: Colors.grey,
                    ),
                    SizedBox(width: responsive.width(2)),
                    Text(
                      _getMonthYearString(),
                      style: TextStyle(
                        fontSize: responsive.fontSize(16),
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Day initials strip
          Container(
            height: responsive.height(5),
            color: Colors.pink[50], // Greyish-pink background
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                return SizedBox(
                  width: responsive.width(8),
                  child: Center(
                    child: Text(
                      _getDayInitial(index + 1),
                      style: TextStyle(
                        fontSize: responsive.fontSize(14),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          // Calendar grid (7x6)
          Padding(
            padding: EdgeInsets.all(responsive.width(2)),
            child: GridView.builder(
              shrinkWrap: true, // Prevent expansion beyond 6 rows
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, // 7 days in a week
                childAspectRatio: 1, // Square cells
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 42, // Fixed 7x6 grid
              itemBuilder: (context, index) {
                final dayData = calendarData[index];
                final date = dayData['date'];
                final isCurrentDay = dayData['isCurrentDay'];
                final month = dayData['month'];
                final year = dayData['year'];

                // Determine text color based on month
                Color textColor;
                if (month == currentMonth && year == currentYear) {
                  textColor = Colors.black; // Current month
                } else {
                  textColor = Colors.grey[400]!; // Previous or next month
                }

                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCurrentDay ? Colors.pink[50] : Colors.grey[100],
                  ),
                  child: Center(
                    child: Text(
                      date,
                      style: TextStyle(
                        fontSize: responsive.fontSize(12),
                        color: textColor, // Apply dynamic color
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
