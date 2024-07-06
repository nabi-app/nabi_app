import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

void showToast({required String message}) {
  final fToast = FToast();

  final context = rootContext;

  if (context == null) return;

  fToast.init(context);

  fToast.showToast(
    child: ToastWidget(message: message),
  );
}

class ToastWidget extends StatelessWidget {
  final String message;

  const ToastWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 12.w,
      ),
      decoration: BoxDecoration(
        color: color999DAC.withOpacity(0.75),
        borderRadius: BorderRadius.circular(20)
      ),
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
