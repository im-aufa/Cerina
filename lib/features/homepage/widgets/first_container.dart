// lib/features/homepage/widgets/first_container.dart
import 'package:cerina/features/calendar/calendar_screen.dart';
import 'package:flutter/material.dart';
import '../data/homepage_data.dart';

class FirstContainer extends StatelessWidget {
  final HomepageData data;

  const FirstContainer({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: screenSize.height * 0.23,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenSize.width * 0.04),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.firstContainerTitle,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              data.firstContainerSubtitle,
              style: textTheme.titleMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalendarScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: data.firstContainerItems.map((item) {
                  final isNumber = !item['image']!.contains('/');

                  return Container(
                    width: screenSize.height * 0.11,
                    height: screenSize.height * 0.11,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item['title']!,
                          style: textTheme.bodySmall,
                        ),
                        isNumber
                            ? Text(
                                item['image']!,
                                style: TextStyle(
                                  fontSize: screenSize.height * 0.04,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Image.asset(
                                item['image']!,
                                width: screenSize.height * 0.04,
                                height: screenSize.height * 0.04,
                              ),
                        Text(
                          item['subtitle']!,
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
