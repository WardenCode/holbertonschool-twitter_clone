import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomFlatButton({
    required this.label,
    required this.onPressed,
    this.fontSize = 30,
    this.fontWeight = FontWeight.normal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: "Raleway",
            fontSize: fontSize,
            height: 1,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
