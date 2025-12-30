import 'package:flutter/material.dart';

class Singlebutton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  const Singlebutton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(padding: EdgeInsets.all(8), child: icon),
      ),
    );
  }
}
