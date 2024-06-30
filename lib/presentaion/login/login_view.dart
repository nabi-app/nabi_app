import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabi_app/presentaion/login/login_view_model.dart';
import 'package:nabi_app/ui/ui_theme.dart';
import 'package:nabi_app/ui/assets.gen.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String name = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _mainSocialLoginButton(
              imagePath: Assets.svg.iconAppleLogin.path,
              onTap: () => context.read<LoginViewModel>().appleLogin(),
            ),
            SizedBox(height: 14.w),
            _mainSocialLoginButton(
              imagePath: Assets.svg.iconKakaoLogin.path,
              onTap: () => context.read<LoginViewModel>().kakaoLogin(),
            ),
            SizedBox(height: 40.w),
            _askText(),
            SizedBox(height: 16.w),
            _inquiryButton(),
          ],
        ),
      ),
    );
  }

  Widget _mainSocialLoginButton({
    required String imagePath,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        imagePath,
        width: 327.w,
        height: 52.w,
      ),
    );
  }

  Widget _askText() {
    return Text(
      "로그인이 안되시나요?",
      style: TextStyle(
        color: color999DAC,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        height: 1,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  Widget _inquiryButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 120.w,
        height: 32.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: color999DAC),
        ),
        child: Text(
          "문의하기",
          style: TextStyle(
            color: color999DAC,
            fontSize: 14.sp,
            height: 1,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
      ),
    );
  }
}
