import 'package:flutter/material.dart';

class FullCalendarScreen extends StatelessWidget {
  const FullCalendarScreen({super.key});

  List<Map<String, dynamic>> _getCalendarData() {
    final now = DateTime.now();
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    int daysToSubtract = (startOfMonth.weekday - 1) % 7;
    DateTime startDate = startOfMonth.subtract(Duration(days: daysToSubtract));

    List<Map<String, dynamic>> calendarData = [];
    DateTime currentDate = startDate;

    for (int i = 0; i < 42; i++) {
      calendarData.add({
        'date': currentDate.day.toString(),
        'weekday': currentDate.weekday,
        'isCurrentDay': currentDate.day == now.day &&
            currentDate.month == now.month &&
            currentDate.year == now.year,
        'month': currentDate.month,
        'year': currentDate.year,
      });
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return calendarData;
  }

  String _getDayInitial(int weekday) {
    const dayInitials = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return dayInitials[weekday - 1];
  }

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
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
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
              width: screenSize.width * 0.20,
              height: screenSize.width * 0.20,
            ),
            SizedBox(width: screenSize.width * 0.02),
          ],
        ),
        centerTitle: true,
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kalender',
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: textTheme.titleMedium?.fontSize,
                      color: Colors.grey,
                    ),
                    SizedBox(width: screenSize.width * 0.02),
                    Text(
                      _getMonthYearString(),
                      style: textTheme.titleMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: screenSize.height * 0.05,
            color: Colors.pink[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                return SizedBox(
                  width: screenSize.width * 0.08,
                  child: Center(
                    child: Text(
                      _getDayInitial(index + 1),
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenSize.width * 0.02),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 42,
              itemBuilder: (context, index) {
                final dayData = calendarData[index];
                final date = dayData['date'];
                final isCurrentDay = dayData['isCurrentDay'];
                final month = dayData['month'];
                final year = dayData['year'];

                Color textColor;
                if (month == currentMonth && year == currentYear) {
                  textColor = Colors.black;
                } else {
                  textColor = Colors.grey[400]!;
                }

                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCurrentDay ? Colors.pink[50] : Colors.grey[100],
                  ),
                  child: Center(
                    child: Text(
                      date,
                      style: textTheme.bodySmall?.copyWith(color: textColor),
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
