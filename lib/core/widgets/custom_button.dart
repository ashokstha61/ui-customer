// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// enum ButtonType { elevated, outlined }

// class CustomButton extends StatelessWidget {
//   final String text;
//   final String? iconPath;
//   final double? width;
//   final double? height;
//   final VoidCallback onPressed;
//   final ButtonType buttonType;
//   final Color? backgroundColor;
//   final Color? textColor;

//   const CustomButton({
//     super.key,
//     required this.text,
//     this.iconPath,
//     required this.onPressed,
//     this.buttonType = ButtonType.elevated,
//     this.backgroundColor,
//     this.textColor,
//     this.width,
//     this.height,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final buttonStyle = RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(8),
//     );

//     if (buttonType == ButtonType.elevated) {
//       return ElevatedButton.icon(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: backgroundColor ?? Colors.orange,
//           shape: buttonStyle,
//         ),
//         onPressed: onPressed,
//         icon: Image.asset(iconPath! , height: 20, width: 20),
//         label: Text(
//           text,
//           style: GoogleFonts.nunito(
//             color: textColor ?? Colors.white,
//             fontSize: 15,
//           ),
//         ),
//       );
//     } else {
//       return OutlinedButton.icon(
//         style: OutlinedButton.styleFrom(
//           shape: buttonStyle,
//           side: BorderSide(color: backgroundColor ?? Colors.grey),
//         ),
//         onPressed: onPressed,
//         icon: Image.asset(iconPath !, height: 20, width: 20),
//         label: Text(
//           text,
//           style: GoogleFonts.nunito(color: textColor ?? Colors.black),
//         ),
//       );
//     }
//   }
// }

import 'package:customer_ui/core/constant/app_color.dart';
import 'package:customer_ui/core/constant/sizeconstant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ButtonType { elevated, outlined }

class CustomButton extends StatelessWidget {
  final String text;
  final String? iconPath;
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final ButtonType buttonType;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    this.iconPath,
    required this.onPressed,
    this.buttonType = ButtonType.elevated,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    );

    final textWidget = Text(
      text,
      style: GoogleFonts.nunito(
        color:
            textColor ??
            (buttonType == ButtonType.elevated ? Colors.white : AppColor.textblackColor),
        fontSize: AppSize.mediumTextSize,
      ),
    );

    Widget button;

    if (buttonType == ButtonType.elevated) {
      button = iconPath != null
          ? ElevatedButton.icon(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? AppColor.buttonColor,
                shape: shape,
              ),
              icon: Image.asset(iconPath!, height: 20, width: 20),
              label: textWidget,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? AppColor.buttonColor,
                shape: shape,
              ),
              child: textWidget,
            );
    } else {
      button = iconPath != null
          ? OutlinedButton.icon(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: shape,
                side: BorderSide(color: backgroundColor ?? Colors.grey),
              ),
              icon: Image.asset(iconPath!, height: 20, width: 20),
              label: textWidget,
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: shape,
                side: BorderSide(color: backgroundColor ?? Colors.grey),
              ),
              child: textWidget,
            );
    }

    return SizedBox(width: width, height: height, child: button);
  }
}
