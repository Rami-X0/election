
import 'package:elections/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final double? size;
  final Widget? child;
  final PreferredSizeWidget? bottom;
  final bool? backButton;
  final Widget? leading;
  final List<Widget>? action;

  const AppAppBar({
    super.key,
    required this.text,
    this.child,
    this.bottom,
    this.size,
    this.backButton,
    this.leading, this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: backButton ?? true,
      bottom: bottom,
      leading: leading,
     actions: action,
      title: Text(
        text,
        style: TextStyles.font60MainColorBold.copyWith(
          fontSize: 20.sp,
        ),
      ),
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size ?? 45.h);
}
