import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class _ToastWidget extends StatelessWidget {
  final String message;
  final double? bottomPadding;

  const _ToastWidget({
    required this.message,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + (bottomPadding ?? 0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 12.w,
      ),
      decoration: BoxDecoration(color: color999DAC.withOpacity(0.75), borderRadius: BorderRadius.circular(20)),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }
}

void showToast({
  required String message,
  double? bottomPadding,
}) {
  final fToast = FToast();

  if (rootContext == null) return;

  fToast.init(rootContext!);

  fToast.showToast(
    child: _ToastWidget(
      message: message,
      bottomPadding: bottomPadding,
    ),
  );
}

void showCommonErrorToast() => showToast(message: "잠시 후에 다시 시도해주세요.");