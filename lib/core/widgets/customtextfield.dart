import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final Widget? icons;
  final Color? backgroundColor;
  final Color? textColor;
  final String hintText;
  final String labelText;
  final double? width;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    this.icons,
    this.backgroundColor,
    this.textColor,
    required this.hintText,
    this.width,
    this.controller,
    this.onTap,
    required this.labelText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 48,
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        readOnly: onTap != null,
        keyboardType: keyboardType,
        style: GoogleFonts.nunito(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor ?? Colors.white,
          hintText: hintText,
          hintStyle: GoogleFonts.nunito(),
          labelText: labelText,
          labelStyle: GoogleFonts.nunito(),

          prefixIcon: icons != null
              ? Image.asset('assets/images/magnifying.png')
              : null,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
