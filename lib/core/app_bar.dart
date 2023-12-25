import 'package:demo/core/color.dart';
import 'package:flutter/material.dart';
import 'package:demo/core/imgs.dart';

class NoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NoAppBar({super.key, this.color});

  final Color? color;

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: color ?? kWhiteColor,
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.color, this.automaticallyImplyLeading})
      : super(key: key);

  final Color? color;
  final bool? automaticallyImplyLeading;

  @override
  Size get preferredSize => const Size.fromHeight(198);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24)),
          color: color ?? kMainColor, // Use your desired color
        ),
        height: preferredSize.height,
        child: Column(
          children: [
            AppBar(
              iconTheme: const IconThemeData(color: kWhiteColor),
              elevation: 0,
              automaticallyImplyLeading: automaticallyImplyLeading ?? false,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              // Add your app bar content here
            ),
            Image.asset(
              pngName('banner'),
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
