import 'package:flutter/material.dart';

class MiniContainer extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;
  final String? backgroundImage;

  const MiniContainer({
    super.key,
    required this.isSelected,
    required this.onPressed,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: screenSize.width * 0.20,
        height: screenSize.width * 0.20,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.pink[400]
              : Colors.white,
          image: backgroundImage != null
              ? DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.contain,
                  scale: 10.0,
                )
              : null,
          borderRadius: BorderRadius.circular(screenSize.width * 0.02),
          border: Border.all(color: Colors.pink),
        ),
      ),
    );
  }
}
