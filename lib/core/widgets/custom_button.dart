import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ButtonType { elevated, outlined }

class CustomButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final ButtonType buttonType;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
    this.buttonType = ButtonType.elevated,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    );

    if (buttonType == ButtonType.elevated) {
      return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.orange,
          shape: buttonStyle,
        ),
        onPressed: onPressed,
        icon: Image.asset(iconPath, height: 20, width: 20),
        label: Text(
          text,
          style: GoogleFonts.nunito(
            color: textColor ?? Colors.white,
            fontSize: 15,
          ),
        ),
      );
    } else {
      return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          shape: buttonStyle,
          side: BorderSide(color: backgroundColor ?? Colors.grey),
        ),
        onPressed: onPressed,
        icon: Image.asset(iconPath, height: 20, width: 20),
        label: Text(
          text,
          style: GoogleFonts.nunito(color: textColor ?? Colors.black),
        ),
      );
    }
  }
}
