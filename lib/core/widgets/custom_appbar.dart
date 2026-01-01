import 'package:beamer/beamer.dart';
import 'package:customer_ui/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBack;
  final String title;
  final int notificationCount;
  final VoidCallback? onPressedNotification;

  const CustomAppbar({
    super.key,
    this.showBack = true,
    required this.title,
    this.notificationCount = 0,
    this.onPressedNotification,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.appbackground,
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () => Beamer.of(context).beamBack(),
            )
          : null,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: NotificationIcon(
            icon: const Icon(Icons.notifications_outlined),
            count: notificationCount,
            onPressed: onPressedNotification,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NotificationIcon extends StatelessWidget {
  final Widget icon;
  final int count;
  final VoidCallback? onPressed;

  const NotificationIcon({
    super.key,
    required this.icon,
    this.count = 0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(iconSize: 24, icon: icon, onPressed: onPressed),
        if (count > 0)
          Positioned(
            top: 2,
            right: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red[500],
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                count > 99 ? '99+' : '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
