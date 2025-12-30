import 'package:customer_ui/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? backIcon;
  final VoidCallback? onPressBack;
  final String title;
  final Widget? notification;

  final VoidCallback? onPressedNotification;
  const CustomAppbar({
    super.key,
    this.backIcon,
    this.onPressBack,
    required this.title,
    this.notification,
    this.onPressedNotification,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 18),
      ),
      centerTitle: true,
      backgroundColor: AppColor.buttonColor,
      // elevation: 1,
      leading: backIcon != null
          ? IconButton(iconSize: 24, icon: backIcon!, onPressed: onPressBack)
          : null,
      actions: [
        if (notification != null)
          IconButton(
            iconSize: 24,
            icon: notification!,
            onPressed: onPressedNotification,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
