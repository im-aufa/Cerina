// lib/features/homepage/widgets/at_card.dart
import 'package:flutter/material.dart';
import 'package:cerina/core/utils/responsive.dart';

class AtCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final Responsive responsive;
  final bool isReversed;

  const AtCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.responsive,
    required this.isReversed,
  });

  @override
  Widget build(BuildContext context) {
    // Fixed dimensions for image
    const double imageWidth = 175; // Fixed 175px
    const double imageHeight = 135; // Fixed 135px
    // Container width must accommodate image + text + padding
    final double containerWidth =
        imageWidth + responsive.width(50); // Image + text space

    return Container(
      width: containerWidth, // Adjusted to fit image + text
      height: imageHeight, // Matches image height
      margin: EdgeInsets.only(
          bottom: responsive.width(2)), // Assuming typo, meant bottom
      decoration: BoxDecoration(
        color: Colors.pink[400], // Pink background across entire card
        borderRadius: BorderRadius.circular(responsive.width(4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: isReversed
            ? [
                // Reversed: Image on left, Text on right
                ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(responsive.width(4)),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: imageWidth, // Fixed 175px
                    height: imageHeight, // Fixed 135px
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(responsive.width(2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: responsive.fontSize(22),
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: responsive.fontSize(14),
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            : [
                // Normal: Text on left, Image on right
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(responsive.width(2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: responsive.fontSize(22),
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: responsive.fontSize(14),
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(responsive.width(4)),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: imageWidth, // Fixed 175px
                    height: imageHeight, // Fixed 135px
                    fit: BoxFit.cover,
                  ),
                ),
              ],
      ),
    );
  }
}
