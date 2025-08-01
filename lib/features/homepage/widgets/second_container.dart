// lib/features/homepage/widgets/second_container.dart
import 'package:cerina/features/ai_asisstant/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:cerina/core/utils/responsive.dart';
import '../data/homepage_data.dart';

class SecondContainer extends StatelessWidget {
  final HomepageData data;
  final double topPosition;

  const SecondContainer({
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
        height: responsive.height(18),
        width: responsive.width(90),
        decoration: BoxDecoration(
          color: Colors.pink[400],
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
          padding: EdgeInsets.all(responsive.width(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/11.png',
                width: responsive.height(14),
                height: responsive.height(14),
              ),
              SizedBox(width: responsive.width(4)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.secondContainerTitle,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.secondContainerSubtitle,
                    style: const TextStyle(
                      fontSize: 31,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Mulai',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
