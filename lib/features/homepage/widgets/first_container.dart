// lib/features/homepage/widgets/first_container.dart
import 'package:cerina/features/calendar/calendar_screen.dart';
import 'package:flutter/material.dart';
import 'package:cerina/core/utils/responsive.dart';
import '../data/homepage_data.dart';

class FirstContainer extends StatelessWidget {
  final HomepageData data;
  final double topPosition;

  const FirstContainer({
    super.key,
    required this.data,
    required this.topPosition,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive();
    responsive.init(context);

    return Positioned(
      top: topPosition,
      left: responsive.width(5),
      right: responsive.width(5),
      child: Container(
        height: responsive.height(23),
        width: responsive.width(90),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(responsive.width(4)),
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
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data.firstContainerSubtitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: responsive.height(2)),
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
                    return Container(
                      width: responsive.height(11),
                      height: responsive.height(11),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item['title']!,
                            style: TextStyle(fontSize: responsive.height(1.5)),
                          ),
                          Image.asset(
                            item['image']!,
                            width: responsive.height(4),
                            height: responsive.height(4),
                          ),
                          Text(
                            item['subtitle']!,
                            style: TextStyle(fontSize: responsive.height(1.5)),
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
      ),
    );
  }
}
