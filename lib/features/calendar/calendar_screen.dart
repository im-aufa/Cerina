import 'package:cerina/features/calendar/widgets/calendar_container.dart';
import 'package:cerina/features/calendar/data/calendar_data.dart';
import 'package:cerina/features/calendar/full_calendar_screen.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final List<int?> _selectedIndices = [null, null, null, null];

  void _onMiniContainerPressed(int calendarIndex, int miniIndex) {
    setState(() {
      _selectedIndices[calendarIndex] =
          _selectedIndices[calendarIndex] == miniIndex ? null : miniIndex;
    });
  }

  void _navigateToFullCalendar() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FullCalendarScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logos/CerinaLogo-Landscape.png',
              width: screenSize.width * 0.20,
              height: screenSize.width * 0.20,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: screenSize.height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih tanggal log',
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Catat log Anda untuk hari ini atau hari sebelumnya.',
                    style: textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            CalendarContainer(
              text: CalendarData.containerTitles[0],
              selectedIndex: _selectedIndices[0],
              onMiniContainerPressed: (index) =>
                  _onMiniContainerPressed(0, index),
              containerIndex: 0,
              customHeight: screenSize.height * 0.12,
              onPressed: _navigateToFullCalendar,
            ),
            CalendarContainer(
              text: CalendarData.containerTitles[1],
              selectedIndex: _selectedIndices[1],
              onMiniContainerPressed: (index) =>
                  _onMiniContainerPressed(1, index),
              containerIndex: 1,
            ),
            CalendarContainer(
              text: CalendarData.containerTitles[2],
              selectedIndex: _selectedIndices[2],
              onMiniContainerPressed: (index) =>
                  _onMiniContainerPressed(2, index),
              containerIndex: 2,
            ),
            CalendarContainer(
              text: CalendarData.containerTitles[3],
              selectedIndex: _selectedIndices[3],
              onMiniContainerPressed: (index) =>
                  _onMiniContainerPressed(3, index),
              containerIndex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
