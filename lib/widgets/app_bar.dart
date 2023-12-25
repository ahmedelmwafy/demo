import 'package:demo/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.title = '',
    this.isBackVisible = true,
    this.action,
    this.backgroundColor = kSecondColor,
  });

  final String title;
  final bool isBackVisible;
  final Widget? action;
  final Color backgroundColor;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      scrolledUnderElevation: .3,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          SizedBox(
            width: 40,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: Navigator.of(context).pop,
              child: Align(
                alignment: Alignment.centerRight,
                child: Visibility(
                  visible: widget.isBackVisible,
                  child: SvgPicture.asset('assets/images/arrow_right.svg'),
                ),
              ),
            ),
          ),
          const Spacer(),
          Text(
            widget.title,
            // style: context.medium14TextMain,
          ),
          const Spacer(),
          SizedBox(
            width: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: widget.action ?? const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
