import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/presentaion/goal/goal_page.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class SignUpCompleteView extends StatelessWidget {
  const SignUpCompleteView({super.key});

  static const String path = "/sign-up-complete";
  static const String name = "SignUpCompleteView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "환영합니다",
              style: TextStyle(
                color: color999DAC,
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
                height: 1.41,
                leadingDistribution: TextLeadingDistribution.even,
              ),
            ),
            SizedBox(height: 40.w,),
            SizedBox(height: 40.w,),
            Text(
              "회원 가입 완료!\n성장의 날개를 펼쳐주세요.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                height: 1.5,
                leadingDistribution: TextLeadingDistribution.even,
              ),
            ),
            SizedBox(height: 130.w,),
            GestureDetector(
              onTap: () => context.goNamed(GoalPage.name),
              child: Container(
                width: 220.w,
                height: 52.w,
                decoration: BoxDecoration(
                  color: color233067,
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.center,
                child: Text(
                  "시작하기",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
