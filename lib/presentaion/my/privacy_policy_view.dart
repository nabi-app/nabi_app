import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  static const String path = "/privacy-policy";
  static const String name = "PrivacyPolicyView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: leftTitleAppBar("개인정보 취급방침"),
      body: Column(
        children: [
          _buildBorder(),
        ],
      ),
    );
  }

  Widget _buildBorder() {
    return Container(
      height: 20.w,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorE4E7ED,
          ),
        ),
      ),
    );
  }
}
