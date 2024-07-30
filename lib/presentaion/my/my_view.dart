import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/presentaion/my/my_view_model.dart';
import 'package:nabi_app/presentaion/my/notice_view.dart';
import 'package:nabi_app/presentaion/my/privacy_policy_view.dart';
import 'package:nabi_app/presentaion/my/usage_term_view.dart';
import 'package:nabi_app/presentaion/my/withdraw_view.dart';
import 'package:nabi_app/user/auth_provider.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/custom_dialog.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:provider/provider.dart';

class MyView extends StatelessWidget {
  const MyView({super.key});

  static const String path = "/my";
  static const String name = "MyView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.only(bottom: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.w),
              _buildUserInfo(context),
              SizedBox(height: 20.w),
              _buildTitle("계정관리"),
              _buildButton(
                text: "이용약관",
                icon: Assets.svg.iconUsageTerm.svg(
                  width: 28.w,
                  height: 28.w,
                ),
                onTap: () => context.pushNamed(UsageTermView.name),
              ),
              _buildButton(
                text: "개인정보 취급방침",
                icon: Assets.svg.iconPrivacyPolicy.svg(
                  width: 28.w,
                  height: 28.w,
                ),
                onTap: () => context.pushNamed(PrivacyPolicyView.name),
              ),
              _buildButton(
                text: "계정탈퇴",
                icon: Assets.svg.iconWithdraw.svg(
                  width: 28.w,
                  height: 28.w,
                ),
                onTap: () => context.pushNamed(WithdrawView.name),
              ),
              _buildButton(
                text: "로그아웃",
                icon: Assets.svg.iconLogout.svg(
                  width: 28.w,
                  height: 28.w,
                ),
                onTap: () => showCustomDialog(
                  title: "로그아웃 할까요?",
                  subTitle: "나비 서비스를 이용하기 위해서는 로그인이 필요해요.\n로그인은 언제든지 다시 할 수 있어요.",
                  button1Text: "아니요",
                  button2Text: "네",
                  onButton2Tap: context.read<MyViewModel>().logout
                ),
              ),
              SizedBox(height: 20.w),
              _buildTitle("계정관리"),
              _buildButton(
                text: "공지사항",
                icon: Assets.svg.iconNotice.svg(
                  width: 28.w,
                  height: 28.w,
                ),
                onTap: () => context.pushNamed(NoticeView.name),
              ),
              _buildButton(
                onTap: () {},
                icon: Assets.svg.iconCustomerCenter.svg(
                  width: 28.w,
                  height: 28.w,
                ),
                text: "고객센터",
              ),
              SizedBox(height: 20.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTitle("앱 버전"),
                  _buildVersionText(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        centerTitle: false,
        leadingWidth: 68.w,
        titleSpacing: 0,
        title: Text(
          "마이페이지",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            height: 1,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
      );

  Widget _buildUserInfo(BuildContext context) {
    final userInfo = context.read<AuthProvider>().userInfo!;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.w,
      ),
      child: Row(
        children: [
          _buildProfile(userInfo.profileImage),
          _buildNickname(userInfo.nickname),
          _buildProfileEditButton(),
        ],
      ),
    );
  }

  Widget _buildProfile(String? profileImage) {
    return Container(
      width: 60.w,
      height: 60.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.pink,
        image: profileImage?.isEmpty ?? true
            ? null
            : DecorationImage(
                image: NetworkImage(profileImage!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  Widget _buildNickname(String nickname) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(
          nickname,
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            height: 1,
            leadingDistribution: TextLeadingDistribution.even,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileEditButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Text(
          "프로필 편집",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            height: 1.4286,
            leadingDistribution: TextLeadingDistribution.even,
            letterSpacing: -1,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 10.w, bottom: 10.w),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Widget icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 10.w,
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  height: 1,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVersionText(BuildContext context) {
    return Selector<MyViewModel, String?>(
      selector: (_, viewModel) => viewModel.version,
      builder: (_, version, __) => version == null
          ? const SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Text(
                "Nabi v.$version",
                style: TextStyle(
                  color: color999DAC,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  height: 1,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
            ),
    );
  }
}
