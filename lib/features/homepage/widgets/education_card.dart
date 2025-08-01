// lib/features/homepage/widgets/education_card.dart
import 'package:flutter/material.dart';
import 'package:cerina/core/utils/responsive.dart';

class EducationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final Responsive responsive;

  const EducationCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.responsive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsive.width(43),
      height: responsive.height(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink[400]!),
        borderRadius: BorderRadius.circular(responsive.width(4)),
      ),
      child: ClipRect(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(responsive.width(4)),
              ),
              child: Image.asset(
                imagePath,
                width: responsive.width(50),
                height: responsive.height(14) * 0.72, // ~10.8% screen height
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: responsive.width(50),
              height: responsive.height(15) * 0.28, // ~4.2% screen height
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(responsive.width(4)),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: responsive.width(2)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: responsive.fontSize(13),
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: responsive.fontSize(11),
                              color: Colors.black54,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: responsive.fontSize(14),
                      color: Colors.pink[400],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
