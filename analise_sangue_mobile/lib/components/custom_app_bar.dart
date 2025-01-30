import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final Function? onBackPressed;
  final Function? onLogoutPressed;

  const CustomAppBar({
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      child: AppBar(
        title: showBackButton
            ? Text(
                title,
                style: TextStyle(color: Colors.white),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
        backgroundColor: colorScheme.primary,
        automaticallyImplyLeading: showBackButton,
        leading: showBackButton
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  if (onBackPressed != null) {
                    onBackPressed!();
                  } else {
                    Navigator.pop(context);
                  }
                },
                color: colorScheme.onPrimary,
              )
            : null,
        actions: [
          if (onLogoutPressed != null)
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                onLogoutPressed!();
              },
              color: colorScheme.onPrimary,
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
