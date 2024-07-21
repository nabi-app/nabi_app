import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class DiaryFilterButton extends StatelessWidget {
  final Widget? icon;
  final String? text;
  final bool selected;
  final VoidCallback? onTap;

  const DiaryFilterButton({
    super.key,
    this.icon,
    this.text,
    required this.selected,
    this.onTap,
  }) : assert(icon == null || text == null, "icon 또는 text 둘중 하나는 제공되어야 합니다.");

  Color get primaryColor => selected ? color233067 : color999DAC;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.w,
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: primaryColor),
          color: colorDBDDE5,
        ),
        child: icon ??
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w),
              child: Text(
                text!,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  height: 1,
                  leadingDistribution: TextLeadingDistribution.even,
                  letterSpacing: -0.48,
                ),
              ),
            ),
      ),
    );
  }
}

class DiaryRadioButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onSelect;

  const DiaryRadioButton({
    super.key,
    required this.text,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: selected ? color233067 : color999DAC,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                height: 1,
                leadingDistribution: TextLeadingDistribution.even,
              ),
            ),
            SvgPicture.asset(
              selected ? Assets.svg.iconRadio.path : Assets.svg.iconCircleEmpty.path,
              width: 20.w,
              height: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}

class DiaryFilterBottomSheet extends StatefulWidget {
  const DiaryFilterBottomSheet({super.key});

  @override
  State<DiaryFilterBottomSheet> createState() => _DiaryFilterBottomSheetState();
}

class _DiaryFilterBottomSheetState extends State<DiaryFilterBottomSheet> {
  List<int> get _monthList => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetFrame(
      title: "필터 설정하기",
      maxHeightRatio: 0.8374,
      bottomWidget: _buildBottomButtons(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30.w),
          _buildCategoryArea(),
          SizedBox(height: 40.w),
          _buildMonthArea(),
          SizedBox(height: 40.w),
          _buildSortArea(),
          SizedBox(height: 75.w),
        ],
      ),
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: Text(
        "중복선택이 가능해요",
        style: TextStyle(
          color: color999DAC,
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }

  Widget _buildCategoryArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title("카테고리"),
        SizedBox(height: 10.w),
        _buildDescription(),
        SizedBox(height: 24.w),
        DiaryRadioButton(
          text: "태그",
          selected: true,
          onSelect: () {},
        ),
        SizedBox(height: 24.w),
        DiaryRadioButton(
          text: "이미지",
          selected: true,
          onSelect: () {},
        ),
        SizedBox(height: 24.w),
        DiaryRadioButton(
          text: "녹음",
          selected: true,
          onSelect: () {},
        ),
      ],
    );
  }

  Widget _buildMonthArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title("월별기준"),
        SizedBox(height: 24.w),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Wrap(
            spacing: 10.w,
            runSpacing: 16.w,
            children: _monthList
                .map(
                  (month) => DiaryFilterButton(
                    text: "$month월",
                    selected: true,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSortArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title("정렬기준"),
        SizedBox(height: 24.w),
        DiaryRadioButton(
          text: "최신순",
          selected: true,
          onSelect: () {},
        ),
        SizedBox(height: 24.w),
        DiaryRadioButton(
          text: "오래된 순",
          selected: true,
          onSelect: () {},
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: EdgeInsets.only(top: 10.w, left: 30.w, right: 30.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: colorEBEDF5)),
      ),
      child: Row(
        children: [
          _buildResetButton(),
          SizedBox(width: 20.w),
          Expanded(
            child: CompleteButton(
              margin: EdgeInsets.zero,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResetButton() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Assets.svg.iconReset.svg(
            width: 24.w,
            height: 24.w,
          ),
          Text(
            "선택 초기화",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              height: 1.25,
              leadingDistribution: TextLeadingDistribution.even,
              letterSpacing: -0.48,
            ),
          ),
        ],
      ),
    );
  }
}

class DiarySortBottomSheet extends StatefulWidget {
  const DiarySortBottomSheet({super.key});

  @override
  State<DiarySortBottomSheet> createState() => _DiarySortBottomSheetState();
}

class _DiarySortBottomSheetState extends State<DiarySortBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetFrame(
      title: "정렬 설정하기",
      maxHeightRatio: 0.4187,
      onComplete: () {},
      completeButtonText: "설정완료",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40.w),
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Text(
              "정렬기준",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                height: 1,
                leadingDistribution: TextLeadingDistribution.even,
              ),
            ),
          ),
          SizedBox(height: 24.w),
          DiaryRadioButton(
            text: "최신순",
            selected: true,
            onSelect: () {},
          ),
          SizedBox(height: 24.w),
          DiaryRadioButton(
            text: "오래된 순",
            selected: false,
            onSelect: () {},
          ),
        ],
      ),
    );
  }
}
