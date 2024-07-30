import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class UsageTermView extends StatelessWidget {
  const UsageTermView({super.key});

  static const String path = "/usage-term";
  static const String name = "UsageTermView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: leftTitleAppBar("이용약관"),
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
