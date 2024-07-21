import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabi_app/presentaion/goal/nabi_custom_view_model.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:provider/provider.dart';

class NabiCustomView extends StatelessWidget {
  const NabiCustomView({super.key});

  static const String path = "/nabi-custom";
  static const String name = "nabiCustom";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        actions: [
          Selector<NabiCustomViewModel, String>(
            selector: (_, viewModel) => viewModel.nabiName,
            builder: (_, nabiName, __) => OutlinedBorderActionButton(
              text: "완료하기",
              activeColor: Colors.black,
              onTap: nabiName.isEmpty ? null : () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          minimum: EdgeInsets.only(bottom: 20.w),
          child: Column(
            children: [
              _buildNabiInfoArea(context),
              SizedBox(height: 60.w),
              _buildCompletedGoal(),
              SizedBox(height: 36.w),
              _buildTopWingColorSettingArea(context),
              SizedBox(height: 30.w),
              _buildBottomWingColorSettingArea(context),
              SizedBox(height: 30.w),
              _buildColorShuffleButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNabiInfoArea(BuildContext context) {
    return Column(
      children: [
        _buildNabiImage(),
        SizedBox(
          height: 20.w,
        ),
        _buildTitleSmall("나비의 이름은..."),
        _buildNabiNameTextField(context),
        SizedBox(
          height: 6.w,
        ),
        _buildShowNabiCardButton(),
      ],
    );
  }

  Widget _buildNabiImage() {
    return Selector<NabiCustomViewModel, String?>(
      selector: (_, viewModel) => viewModel.nabiSvgContent,
      builder: (_, svgContent, __) => AspectRatio(
        aspectRatio: 375 / 306,
        child: Container(
          decoration: BoxDecoration(
            color: colorF1F2F7,
            borderRadius: BorderRadius.circular(90),
          ),
          alignment: Alignment.center,
          child: svgContent == null
              ? const SizedBox.shrink()
              : SvgPicture.string(
                  svgContent,
                  width: 262.w,
                  height: 146.w,
                ),
        ),
      ),
    );
  }

  Widget _buildNabiNameTextField(BuildContext context) {
    final baseTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 20.sp,
      height: 1,
      leadingDistribution: TextLeadingDistribution.even,
    );

    return CustomTextField(
      hintText: "나비의 이름을 적어주세요",
      textAlign: TextAlign.center,
      style: baseTextStyle,
      hintStyle: baseTextStyle.copyWith(color: colorC6C8CF),
      contentPadding: EdgeInsets.symmetric(vertical: 14.w),
      maxLines: 1,
      onChanged: context.read<NabiCustomViewModel>().onNabiNameChanged,
    );
  }

  Widget _buildShowNabiCardButton() {
    return Selector<NabiCustomViewModel, String>(
      selector: (_, viewModel) => viewModel.nabiName,
      builder: (context, nabiName, __) {
        final nameIsEmpty = nabiName.isEmpty;
        return GestureDetector(
          onTap: nameIsEmpty
              ? null
              : () => showDialog(
                    context: context,
                    builder: (_) => _buildNabiCard(
                      nabiName: nabiName,
                      nabiSvgContent: context.read<NabiCustomViewModel>().nabiSvgContent!,
                      completedGoalName: "7월 까지 솔랭 골드 찍기😋",
                      completeDate: "2024.07.07",
                    ),
                  ),
          child: Container(
            width: 124.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: nameIsEmpty ? colorC6C8CF : Colors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            alignment: Alignment.center,
            child: Text(
              "나비카드 보기",
              style: TextStyle(
                color: nameIsEmpty ? colorE4E4E4 : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.w,
                letterSpacing: -0.48,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNabiCard({
    required String nabiName,
    required String nabiSvgContent,
    required String completedGoalName,
    required String completeDate,
  }) {
    return AlertDialog(
      backgroundColor: colorFFFBE4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: EdgeInsets.symmetric(horizontal: 48.w),
      contentPadding: EdgeInsets.all(20.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            nabiName,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              height: 1,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          SizedBox(height: 30.w),
          SvgPicture.string(
            nabiSvgContent,
            width: 156.w,
            height: 87.w,
          ),
          SizedBox(height: 30.w),
          Text(
            "완료된 목표",
            style: TextStyle(
              color: color9F9F9F,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              height: 1.5,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          SizedBox(height: 10.w),
          Text(
            completedGoalName,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              height: 1.3,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          SizedBox(height: 53.w),
          Text(
            completeDate,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              height: 1.5,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCompletedGoal() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitleSmall("완료된 목표"),
          SizedBox(height: 10.w),
          Text(
            "7월 까지 솔랭 골드 찍기😋",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.w,
              height: 1.5625,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopWingColorSettingArea(BuildContext context) {
    final viewModel = context.read<NabiCustomViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: _buildTitleSmall("날개 위 색상"),
        ),
        SizedBox(height: 14.w),
        SizedBox(
          height: 85.w,
          child: ListView.separated(
            itemCount: viewModel.colors.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (_, index) => Selector<NabiCustomViewModel, int>(
              selector: (_, viewModel) => viewModel.topWingColorIndex,
              builder: (_, colorIndex, __) => _buildColorButton(
                color: viewModel.colors[index],
                selected: colorIndex == index,
                onTap: () => viewModel.onTopWingColorChanged(index),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomWingColorSettingArea(BuildContext context) {
    final viewModel = context.read<NabiCustomViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: _buildTitleSmall("날개 아래 색상"),
        ),
        SizedBox(height: 14.w),
        SizedBox(
          height: 85.w,
          child: ListView.separated(
            itemCount: viewModel.colors.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (_, index) => Selector<NabiCustomViewModel, int>(
              selector: (_, viewModel) => viewModel.bottomWingColorIndex,
              builder: (_, colorIndex, __) => _buildColorButton(
                color: viewModel.colors[index],
                selected: colorIndex == index,
                onTap: () => viewModel.onBottomWingColorChanged(index),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColorShuffleButton(BuildContext context) {
    return GestureDetector(
      onTap: context.read<NabiCustomViewModel>().shuffleColor,
      child: Container(
        width: 157.w,
        height: 40.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: colorA6A7AC),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.svg.iconShuffle.svg(),
            SizedBox(width: 10.w),
            Text(
              "랜덤 색상 돌리기",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                height: 1.375,
                leadingDistribution: TextLeadingDistribution.even,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildColorButton({
    required ({String name, Color innerColor, Color borderColor}) color,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 70 / 85,
        child: Container(
          padding: EdgeInsets.all(7.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: selected
                ? Border.all(
                    color: Colors.black,
                    width: 1.5,
                  )
                : Border.all(
                    color: colorE4E7ED,
                  ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AspectRatio(
                aspectRatio: 54 / 48,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: color.borderColor),
                    color: color.innerColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              Text(
                color.name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  height: 1,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSmall(String text) {
    return Text(
      text,
      style: TextStyle(
        color: color999DAC,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        height: 1,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }
}
