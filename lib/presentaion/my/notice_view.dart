import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/presentaion/my/notice_detail_view.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class NoticeView extends StatelessWidget {
  const NoticeView({super.key});

  static const String path = "/notice";
  static const String name = "NoticeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: leftTitleAppBar("공지사항"),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.only(bottom: 16.w),
          child: Column(
            children: [
              _buildBorder(),
              _buildItem(context),
              _buildItem(context),
            ],
          ),
        ),
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

  Widget _buildItem(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(NoticeDetailView.name),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 21.w,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: colorE4E7ED,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "나비 서비스 에러 안내",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                height: 1.375,
                leadingDistribution: TextLeadingDistribution.even,
              ),
            ),
            SizedBox(height: 6.w),
            Text(
              "2023. 05. 23",
              style: TextStyle(
                color: color999DAC,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                height: 1,
                leadingDistribution: TextLeadingDistribution.even,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
