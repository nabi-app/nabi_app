import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const BottomButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (_, isKeyboardVisible) {
        return ColoredBox(
          color: colorE4D7ED,
          child: Container(
            width: double.infinity,
            height: 52.w,
            padding: isKeyboardVisible ? null : EdgeInsets.symmetric(horizontal: 16.w),
            margin: isKeyboardVisible
                ? null
                : EdgeInsets.only(
                    top: 10.w,
                    bottom: 16.w + MediaQuery.of(context).padding.bottom,
                  ),
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: color233067,
                disabledBackgroundColor: colorC6C8CF,
                foregroundColor: Colors.white,
                disabledForegroundColor: colorE4E4E4,
                shape: RoundedRectangleBorder(
                  borderRadius: isKeyboardVisible ? BorderRadius.zero : BorderRadius.circular(100),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
