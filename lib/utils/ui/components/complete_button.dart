import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class CompleteButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final EdgeInsetsGeometry? margin;

  const CompleteButton({
    super.key,
    this.onTap,
    this.text = "설정완료",
    this.margin,
  });

  bool get active => onTap != null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 48.w,
        decoration: BoxDecoration(
          color: active ? color233067 : colorC6C8CF,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: margin ?? EdgeInsets.symmetric(horizontal: 30.w),
        child: Text(
          text,
          style: TextStyle(
            color: active ? Colors.white : colorE4E4E4,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            height: 1.25,
            leadingDistribution: TextLeadingDistribution.even,
            letterSpacing: -0.48,
          ),
        ),
      ),
    );
  }
}
