import 'package:cerina/core/utils/responsive.dart';
import 'package:cerina/features/calendar/widgets/mini_container.dart';
import 'package:cerina/features/calendar/data/calendar_data.dart';
import 'package:flutter/material.dart';

class CalendarContainer extends StatelessWidget {
  final Responsive responsive;
  final String text;
  final int? selectedIndex;
  final Function(int) onMiniContainerPressed;
  final int containerIndex;
  final double? customHeight;
  final VoidCallback? onPressed; // New optional callback for tap

  const CalendarContainer({
    super.key,
    required this.responsive,
    required this.text,
    required this.selectedIndex,
    required this.onMiniContainerPressed,
    required this.containerIndex,
    this.customHeight,
    this.onPressed, // Added parameter
  });

  static const List<String> miniContainerImages2 = [
    'assets/images/mini1.png',
    'assets/images/mini1.2.png',
    'assets/images/mini1.3.png',
    'assets/images/mini1.4.png',
  ];

  static const List<String> miniContainerImages3 = [
    'assets/images/mini2.png',
    'assets/images/mini2.2.png',
    'assets/images/mini2.3.png',
    'assets/images/mini2.4.png',
  ];

  static const List<String> miniContainerImages4 = [
    'assets/images/mini3.png',
    'assets/images/mini3.2.png',
    'assets/images/mini3.3.png',
    'assets/images/mini3.4.png',
  ];

  @override
  Widget build(BuildContext context) {
    List<String>? miniContainerImages;
    switch (containerIndex) {
      case 1:
        miniContainerImages = miniContainerImages2;
        break;
      case 2:
        miniContainerImages = miniContainerImages3;
        break;
      case 3:
        miniContainerImages = miniContainerImages4;
        break;
      default:
        miniContainerImages = null;
    }

    final weekData = containerIndex == 0 ? CalendarData.getWeekData() : null;
    final now = DateTime.now();
    final currentDay = now.day.toString();

    return GestureDetector(
      onTap: containerIndex == 0
          ? onPressed
          : null, // Enable tap only for Container 1
      child: Container(
        width: responsive.width(90),
        height: customHeight ?? responsive.height(15),
        margin: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: responsive.height(1),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(responsive.width(4)),
          border: Border.all(color: Colors.pink),
        ),
        child: containerIndex == 0 && weekData != null
            ? Column(
                children: [
                  Container(
                    height: responsive.height(5),
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(responsive.width(4)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(7, (index) {
                        return SizedBox(
                          width: responsive.width(8),
                          child: Center(
                            child: Text(
                              weekData[index]['initial']!,
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
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(7, (index) {
                        bool isCurrentDay =
                            weekData[index]['date'] == currentDay;
                        return Container(
                          width: responsive.width(8),
                          height: responsive.width(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                isCurrentDay ? Colors.pink[50] : Colors.white,
                            border: Border.all(color: Colors.pink),
                          ),
                          child: Center(
                            child: Text(
                              weekData[index]['date']!,
                              style: TextStyle(
                                fontSize: responsive.fontSize(12),
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: responsive.width(2)),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: responsive.fontSize(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: responsive.height(1)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      String? backgroundImage = miniContainerImages != null
                          ? miniContainerImages[index]
                          : null;
                      return MiniContainer(
                        responsive: responsive,
                        isSelected: selectedIndex == index,
                        onPressed: () => onMiniContainerPressed(index),
                        backgroundImage: backgroundImage,
                      );
                    }),
                  ),
                ],
              ),
      ),
    );
  }
}
