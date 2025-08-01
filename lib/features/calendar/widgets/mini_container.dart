import 'package:cerina/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class MiniContainer extends StatelessWidget {
  final Responsive responsive;
  final bool isSelected;
  final VoidCallback onPressed;
  final String? backgroundImage;

  const MiniContainer({
    super.key,
    required this.responsive,
    required this.isSelected,
    required this.onPressed,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: responsive.width(20), // Original size
        height: responsive.width(20), // Original size
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.pink[400]
              : Colors.white, // Pink if selected, white otherwise
          image: backgroundImage != null
              ? DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.contain,
                  scale: 10.0, // Scales image down (higher value = smaller)
                )
              : null,
          borderRadius: BorderRadius.circular(responsive.width(2)),
          border: Border.all(color: Colors.pink),
        ),
      ),
    );
  }
}
