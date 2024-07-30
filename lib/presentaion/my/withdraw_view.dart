import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/presentaion/my/withdraw_view_model.dart';
import 'package:nabi_app/utils/ui/components/custom_dialog.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:provider/provider.dart';

class WithdrawView extends StatelessWidget {
  const WithdrawView({super.key});

  static const String path = "/withdraw";
  static const String name = "WithdrawView";

  List<String> get _contents => [
        " • 모든 목표가 사라져요",
        " • 모든 목표 알림이 사라져요",
        " • 작성한 모든 일기가 사라져요",
        " • 각종 유용한 정보와 이벤트 수신이 어려워요",
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: leftTitleAppBar("계정 탈퇴"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28.w),
            _buildTitle(),
            SizedBox(height: 20.w),
            _buildContents(),
            SizedBox(height: 30.w),
            _buildWithdrawButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "잠시만요! 계정 탈퇴 전에 읽어보세요!",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
        height: 1.39,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  Widget _buildContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _contents
          .map(
            (content) => Text(
              content,
              style: TextStyle(
                color: color999DAC,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                height: 1.786,
                leadingDistribution: TextLeadingDistribution.even,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildWithdrawButton(BuildContext context) {
    return CompleteButton(
      text: "탈퇴하기",
      margin: EdgeInsets.zero,
      activeBackgroundColor: Colors.black,
      height: 44.w,
      onTap: () => showCustomDialog(
        title: "탈퇴할까요?",
        subTitle: "설정하신 목표, 알림, 일기, 나비 컬렉션 등 많은 이야기들이 사라져요!",
        button1Text: "아니요",
        button2Text: "네, 탈퇴해요",
        onButton2Tap: context.read<WithdrawViewModel>().withdraw,
      ),
    );
  }
}
