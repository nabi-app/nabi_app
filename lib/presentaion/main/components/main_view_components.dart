import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainFloatingActionButton extends StatelessWidget {
  final Color color;
  final Widget child;
  final VoidCallback onPressed;

  const MainFloatingActionButton({
    super.key,
    required this.color,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.w,
      height: 56.w,
      child: FloatingActionButton(
        elevation: 0,
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class MainPopupMenu extends StatelessWidget {
  final List<MainPopupMenuItem> items;

  const MainPopupMenu({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.w),
      ),
      margin: EdgeInsets.only(bottom: 21.w),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 8.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }
}

class MainPopupMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MainPopupMenuItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              height: 1,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
        ),
      ),
    );
  }
}
