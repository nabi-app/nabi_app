import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/ui/ui_theme.dart';
import 'package:nabi_app/ui/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpPageTitle extends StatelessWidget {
  final String title;

  const SignUpPageTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22.sp,
          height: 1.36,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }
}

class SignUpNicknameField extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const SignUpNicknameField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<SignUpNicknameField> createState() => _SignUpNicknameFieldState();
}

class _SignUpNicknameFieldState extends State<SignUpNicknameField> {
  late final TextEditingController _controller = TextEditingController(text: widget.value);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: _onChanged,
      maxLength: 10,
      decoration: InputDecoration(
        hintText: "10자 이내로 입력해주세요.",
        hintStyle: TextStyle(
          color: colorC6C8CF,
          fontSize: 20.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        isDense: true,
        counterText: "",
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.w),
      ),
      style: TextStyle(
        color: color233067,
        fontSize: 20.sp,
        height: 1,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  void _onChanged(String value) {
    widget.onChanged(value);
  }
}

class SignUpDuplicationCheckButton extends StatelessWidget {
  final VoidCallback? onTap;

  const SignUpDuplicationCheckButton({
    super.key,
    required this.onTap,
  });

  bool get enable => onTap != null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 79.w,
        height: 40.w,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(
          color: enable ? Colors.black : colorC6C8CF,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          "중복확인",
          style: TextStyle(
            color: enable ? Colors.white : colorE4E4E4,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            height: 1,
          ),
        ),
      ),
    );
  }
}


class SignUpTermItem extends StatelessWidget {
  final String text;
  final String? linkUrl;
  final bool selected;
  final VoidCallback onSelected;

  const SignUpTermItem({
    super.key,
    required this.text,
    this.linkUrl,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(),
        _buildText(),
        _buildLinkButton(),
      ],
    );
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: onSelected,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: selected
            ? Assets.svg.iconCircleCheck.svg(width: 24.w, height: 24.w)
            : Assets.svg.iconCircleEmpty.svg(width: 24.w, height: 24.w),
      ),
    );
  }

  Widget _buildText() {
    return Expanded(
      child: Text(
        text,
        style: const TextStyle(
          color: color999DAC,
          fontSize: 16,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }

  Widget _buildLinkButton() {
    if (linkUrl == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(linkUrl!)),
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Assets.svg.iconArrowRight.svg(width: 24.w, height: 24.w),
      ),
    );
  }
}

class SignUpPageView extends StatefulWidget {
  final PageController pageController;
  final List<Widget> children;

  const SignUpPageView({
    super.key,
    required this.pageController,
    required this.children,
  });

  @override
  State<SignUpPageView> createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  late double _widthFactor;

  @override
  void initState() {
    super.initState();
    _widthFactor = 1 / widget.children.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLinearIndicator(),
        Expanded(
          child: PageView(
            controller: widget.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: _onPageChanged,
            children: widget.children,
          ),
        ),
      ],
    );
  }

  Widget _buildLinearIndicator() {
    return Container(
      width: double.infinity,
      height: 2,
      color: colorE4D7ED,
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: _widthFactor,
        child: Container(
          height: 2,
          color: color233067,
        ),
      ),
    );
  }

  void _onPageChanged(int page) {
    _widthFactor = (page + 1) / widget.children.length;
    setState(() {});
  }
}
