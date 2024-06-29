import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/utils/components/bottom_button.dart';
import 'package:nabi_app/utils/components/custom_scaffold.dart';
import 'package:nabi_app/presentaion/sign_up/components/sign_up_view_components.dart';
import 'package:nabi_app/presentaion/sign_up/sign_up_complete_view.dart';
import 'package:nabi_app/presentaion/sign_up/sign_up_view_model.dart';
import 'package:nabi_app/ui/ui_theme.dart';
import 'package:nabi_app/ui/assets.gen.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const String name = "signUp";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: _appBar(),
      body: Consumer<SignUpViewModel>(
        builder: (_, viewModel, child) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              child!,
              BottomButton(
                text: "다음",
                onTap: _buttonEnable(viewModel) ? _onNextTap : null,
              ),
            ],
          );
        },
        child: SignUpPageView(
          pageController: _pageController,
          children: const [
            _SignUpTermsPage(),
            _SignUpNicknamePage(),
            _SignUpProfilePage(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 72.w,
      leading: GestureDetector(
        onTap: _onLeadingTap,
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 14.w),
          child: Assets.svg.iconArrowLeft.svg(
            width: 38.w,
            height: 38.w,
          ),
        ),
      ),
      leadingWidth: 68.w,
      titleSpacing: 0,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "회원가입하기",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  int get currentPage {
    if (_pageController.positions.isEmpty) {
      return 0;
    }

    return _pageController.page?.toInt() ?? 0;
  }

  bool _buttonEnable(SignUpViewModel viewModel) {
    if (currentPage == 0) {
      return true;
    }

    if (currentPage == 1) {
      return viewModel.satisfyNicknameCondition && viewModel.passNicknameDuplicationCheck;
    }

    return true;
  }

  void _onLeadingTap() async {
    if (currentPage == 0) {
      context.pop();
      return;
    }

    if (currentPage == 1) {
      _unfocus();
    }

    await _animateToPage(currentPage - 1);
    setState(() {});
  }

  void _onNextTap() async {
    if (currentPage == 2) {
      context.goNamed(SignUpCompleteView.name);
      return;
    }

    if (currentPage == 1) {
      _unfocus();
    }

    await _animateToPage(currentPage + 1);
    setState(() {});
  }

  Future<void> _animateToPage(int page) async {
    await _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  void _unfocus() {
    FocusScope.of(context).unfocus();
  }
}

class _SignUpTermsPage extends StatelessWidget {
  const _SignUpTermsPage();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignUpViewModel>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.w),
          const SignUpPageTitle(title: "이용 약관에 대한 동의가\n필요해요!"),
          SizedBox(height: 50.w),
          SignUpTermItem(
            text: "만 14세 이상입니다 (필수)",
            selected: true,
            onSelected: () {},
          ),
          SizedBox(height: 20.w),
          SignUpTermItem(
            text: "서비스 이용약관 동의 (필수)",
            selected: false,
            linkUrl: "",
            onSelected: () => viewModel.onTermSelected(),
          ),
          SizedBox(height: 20.w),
          SignUpTermItem(
            text: "개인정보 수집 방침 안내 (필수)",
            selected: true,
            linkUrl: "",
            onSelected: () {},
          ),
          SizedBox(height: 20.w),
          SignUpTermItem(
            text: "이벤트 마케팅 수신 동의 (선택)",
            selected: false,
            linkUrl: "",
            onSelected: () {},
          ),
        ],
      ),
    );
  }
}

class _SignUpNicknamePage extends StatelessWidget {
  const _SignUpNicknamePage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.w),
          const SignUpPageTitle(title: "사용할 닉네임을\n입력해주세요"),
          SizedBox(height: 16.w),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "내 이름은...",
              style: TextStyle(
                color: color999DAC,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 1,
                leadingDistribution: TextLeadingDistribution.even,
              ),
            ),
          ),
          SizedBox(height: 18.w),
          Consumer<SignUpViewModel>(
            builder: (_, viewModel, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SignUpNicknameField(
                          value: viewModel.nickname,
                          onChanged: viewModel.onNicknameChanged,
                        ),
                      ),
                      SignUpDuplicationCheckButton(
                        onTap: viewModel.satisfyNicknameCondition ? viewModel.checkDuplication : null,
                      ),
                    ],
                  ),
                  _buildBottomText(viewModel),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomText(SignUpViewModel viewModel) {
    if (!viewModel.passNicknameValidationCheck) {
      return _bottomText(
        text: "특수문자는 사용할 수 없어요.",
        color: Colors.red,
      );
    }

    if (!viewModel.tryNicknameDuplicationCheck) return const SizedBox.shrink();

    if (viewModel.passNicknameDuplicationCheck) {
      return _bottomText(
        text: "좋은 닉네임입니다!",
        color: color14DA28,
      );
    }

    return _bottomText(
      text: "사용중인 닉네임입니다. 다른 닉네임을 입력해주세요.",
      color: Colors.red,
    );
  }

  Widget _bottomText({
    required String text,
    required Color color,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 16.w),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 14.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }
}

class _SignUpProfilePage extends StatelessWidget {
  const _SignUpProfilePage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 60.w),
          const Align(
            alignment: Alignment.centerLeft,
            child: SignUpPageTitle(title: "사용할 프로필 이미지를\n설정해주세요"),
          ),
          SizedBox(height: 50.w),
          Selector<SignUpViewModel, File?>(
            builder: (_, file, child) => GestureDetector(
              onTap: context.read<SignUpViewModel>().pickProfileImage,
              child: Stack(
                children: [
                  _buildProfileImage(file),
                  child!,
                ],
              ),
            ),
            selector: (_, viewModel) => viewModel.profileImage,
            child: Positioned(
              right: 3.5.w,
              bottom: 0,
              child: Assets.svg.iconCircleAdd.svg(
                width: 28.w,
                height: 28.w,
              ),
            ),
          ),
          SizedBox(height: 30.w),
          Text(
            "사용자 닉네임",
            style: TextStyle(
              color: color999DAC,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              height: 1,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          SizedBox(height: 10.w),
          Text(
            context.read<SignUpViewModel>().nickname,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              height: 1,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          SizedBox(height: 30.w),
          Text(
            "프로필 이미지를 설정하지 않으면\n기본 아이콘으로 활동해요.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color999DAC,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              height: 1.5,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage(File? file) {
    if (file == null) {
      return Assets.svg.iconProfile.svg(
        width: 100.w,
        height: 100.w,
      );
    }

    return Container(
      width: 100.w,
      height: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: MemoryImage(file.readAsBytesSync()),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
