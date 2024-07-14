import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class OutlinedBorderActionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color activeColor;
  final Color inactiveColor;
  final EdgeInsetsGeometry? margin;

  const OutlinedBorderActionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.activeColor = color3373F1,
    this.inactiveColor = color999DAC,
    this.margin,
  });

  bool get active => onTap != null;

  Color get color => active ? activeColor : inactiveColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11.w),
        margin: margin ?? EdgeInsets.only(right: 16.w),
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
