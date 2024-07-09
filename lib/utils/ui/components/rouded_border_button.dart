import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class RoundedBorderButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Color activeColor;
  final Color inactiveColor;

  const RoundedBorderButton({
    super.key,
    required this.onTap,
    required this.text,
    this.activeColor = color3373F1,
    this.inactiveColor = color999DAC,
  });

  bool get active => onTap != null;

  Color get color => active ? activeColor : inactiveColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11.w),
        height: 28.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: color,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            height: 1.25,
            letterSpacing: -0.48,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
      ),
    );
  }
}
