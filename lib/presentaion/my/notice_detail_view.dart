import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class NoticeDetailView extends StatelessWidget {
  const NoticeDetailView({super.key});

  static const String path = "detail";
  static const String name = "NoticeDetailView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: leftTitleAppBar("공지사항"),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.only(bottom: 16.w),
          child: Column(
            children: [
              _buildHeader(),
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
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
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 22.w,
      ),
      child: Text(
        """작업일시 : 2023년 5월 14일 일요일 02:00 ~06:00(4시간)
작업내용 : 우리은행 시스템 점검 작업으로 인한 전체 점검

우리은행 시스템 점검 작업으로 인해 자억ㅂ 시간 동안 우리은행을 통한 당근페이 서비스 이용이 제한돼요.

앞으로도 더 안정적이고 쾌적한 당근마켓을 사용하실 수 있도록 정말 많이 노력할게요~

계속 지켜봐주세요!

항상 고맙습니다.""",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          height: 1.4286,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }
}
