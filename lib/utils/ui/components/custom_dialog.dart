import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class _CustomDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? button1Text;
  final String? button2Text;
  final VoidCallback? onButton1Tap;
  final VoidCallback? onButton2Tap;

  const _CustomDialog({
    required this.title,
    required this.subTitle,
    this.button1Text,
    this.button2Text,
    this.onButton1Tap,
    this.onButton2Tap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      title: Center(child: Text(title)),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
        height: 1.22,
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: -0.48,
      ),
      titlePadding: EdgeInsets.only(top: 20.w, bottom: 10.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            subTitle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.w),
          Row(
            children: [
              if (button1Text != null)
                ...[
                  _buildButton(
                    title: button1Text!,
                    color: colorF1F2F7,
                    textColor: color999DAC,
                    onTap: () {
                      if (onButton1Tap == null) {
                        context.pop();
                        return;
                      }

                      onButton1Tap!();
                      context.pop();
                    },
                  ),
                  SizedBox(width: 6.w),
                ],
              _buildButton(
                title: button2Text ?? "완료",
                onTap: () {
                  if (onButton2Tap == null) {
                    context.pop();
                    return;
                  }

                  onButton2Tap!();
                  context.pop();
                },
              ),
            ],
          )
        ],
      ),
      contentTextStyle: TextStyle(
        color: color999DAC,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        height: 1.5,
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: -0.48,
      ),
      contentPadding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildButton({
    required String title,
    Color color = color233067,
    Color textColor = Colors.white,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48.w,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              letterSpacing: -0.48,
            ),
          ),
        ),
      ),
    );
  }
}

void showCustomDialog({
  required String title,
  required String subTitle,
  String? button1Text,
  String? button2Text,
  VoidCallback? onButton1Tap,
  VoidCallback? onButton2Tap,
}) {
  if (rootContext == null) return;

  showDialog(
    context: rootContext!,
    builder: (_) =>
        _CustomDialog(
          title: title,
          subTitle: subTitle,
          button1Text: button1Text,
          button2Text: button2Text,
          onButton1Tap: onButton1Tap,
          onButton2Tap: onButton2Tap,
        ),
  );
}