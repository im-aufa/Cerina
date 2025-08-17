import 'package:cerina/features/calendar/widgets/mini_container.dart';
import 'package:cerina/features/calendar/data/calendar_data.dart';
import 'package:flutter/material.dart';

class CalendarContainer extends StatelessWidget {
  final String text;
  final int? selectedIndex;
  final Function(int) onMiniContainerPressed;
  final int containerIndex;
  final double? customHeight;
  final VoidCallback? onPressed;

  const CalendarContainer({
    super.key,
    required this.text,
    required this.selectedIndex,
    required this.onMiniContainerPressed,
    required this.containerIndex,
    this.customHeight,
    this.onPressed,
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
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

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
      onTap: containerIndex == 0 ? onPressed : null,
      child: Container(
        width: screenSize.width * 0.90,
        height: customHeight ?? screenSize.height * 0.15,
        margin: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: screenSize.height * 0.01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenSize.width * 0.04),
          border: Border.all(color: Colors.pink),
        ),
        child: containerIndex == 0 && weekData != null
            ? Column(
                children: [
                  Container(
                    height: screenSize.height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(screenSize.width * 0.04),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(7, (index) {
                        return SizedBox(
                          width: screenSize.width * 0.08,
                          child: Center(
                            child: Text(
                              weekData[index]['initial']!,
                              style: textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
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
                          width: screenSize.width * 0.08,
                          height: screenSize.width * 0.08,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isCurrentDay ? Colors.pink[50] : Colors.white,
                            border: Border.all(color: Colors.pink),
                          ),
                          child: Center(
                            child: Text(
                              weekData[index]['date']!,
                              style: textTheme.bodySmall,
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
                    padding: EdgeInsets.only(left: screenSize.width * 0.02),
                    child: Text(
                      text,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      String? backgroundImage = miniContainerImages != null
                          ? miniContainerImages[index]
                          : null;
                      return MiniContainer(
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
