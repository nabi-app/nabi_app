import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nabi_app/domain/model/diary_item_data.dart';
import 'package:nabi_app/enum/diary_type.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class DiaryItemCard extends StatelessWidget {
  final DiaryItemData item;
  final VoidCallback onTap;

  const DiaryItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(14.w, 14.w, 14.w, 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildRepresentaionImage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDate(),
                _buildHashTagList(),
              ],
            ),
            Container(
              height: 1,
              margin: EdgeInsets.only(top: 9.w),
              color: colorE4E7ED,
            ),
            SizedBox(height: 20.w),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildRepresentaionImage() {
    if (item.images?.isEmpty ?? true) return const SizedBox.shrink();

    return Container(
      height: 168.w,
      margin: EdgeInsets.only(bottom: 14.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          image: DecorationImage(image: NetworkImage(item.images!.first), fit: BoxFit.cover)),
    );
  }

  Widget _buildDate() {
    return Text(
      DateFormat("yyyy년 M월 d일 E요일", "ko_KR").format(item.date),
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        height: 1.25,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  Widget _buildHashTagList() {
    return Row(
      children: [
        if (item.images?.isNotEmpty ?? false) ...[
          _buildHashTag(
            Assets.svg.iconAlbum.svg(
              width: 14.w,
              height: 14.w,
              colorFilter: const ColorFilter.mode(
                color999DAC,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 6.w),
        ],
        if (item.record != null) ...[
          _buildHashTag(
            Assets.svg.iconMic.svg(
              width: 14.w,
              height: 14.w,
              colorFilter: const ColorFilter.mode(
                color999DAC,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 6.w),
        ],
        if (item.tags?.isNotEmpty ?? false)
          _buildHashTag(
            Assets.svg.iconTag.svg(
              width: 14.w,
              height: 14.w,
              colorFilter: const ColorFilter.mode(
                color999DAC,
                BlendMode.srcIn,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildHashTag(Widget icon) {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
        color: colorF1F2F7,
        borderRadius: BorderRadius.circular(8.w),
      ),
      alignment: Alignment.center,
      child: icon,
    );
  }

  Widget _buildContent() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        item.content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }
}

class DiaryFilterButton extends StatelessWidget {
  final Widget? icon;
  final String? text;
  final bool selected;
  final VoidCallback? onTap;

  const DiaryFilterButton({
    super.key,
    this.icon,
    this.text,
    this.selected = true,
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
      behavior: HitTestBehavior.translucent,
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
  final bool isTagFilterSelected;
  final bool isImageFilterSelected;
  final bool isRecordFilterSelected;
  final int? filterMonth;
  final DiaryListOrderType orderType;

  const DiaryFilterBottomSheet({
    super.key,
    required this.isTagFilterSelected,
    required this.isImageFilterSelected,
    required this.isRecordFilterSelected,
    required this.filterMonth,
    required this.orderType,
  });

  @override
  State<DiaryFilterBottomSheet> createState() => _DiaryFilterBottomSheetState();
}

class _DiaryFilterBottomSheetState extends State<DiaryFilterBottomSheet> {
  final List<int> _monthList = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  late bool _isTagFilterSelected;
  late bool _isImageFilterSelected;
  late bool _isRecordFilterSelected;
  late int? _filterMonth;
  late DiaryListOrderType _orderType;

  @override
  void initState() {
    super.initState();
    _isTagFilterSelected = widget.isTagFilterSelected;
    _isImageFilterSelected = widget.isImageFilterSelected;
    _isRecordFilterSelected = widget.isRecordFilterSelected;
    _filterMonth = widget.filterMonth;
    _orderType = widget.orderType;
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetFrame(
      title: "필터 설정하기",
      height: 646.w,
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
          SizedBox(height: 80.w),
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
          selected: _isTagFilterSelected,
          onSelect: () => setState(() => _isTagFilterSelected = !_isTagFilterSelected),
        ),
        SizedBox(height: 24.w),
        DiaryRadioButton(
          text: "이미지",
          selected: _isImageFilterSelected,
          onSelect: () => setState(() => _isImageFilterSelected = !_isImageFilterSelected),
        ),
        SizedBox(height: 24.w),
        DiaryRadioButton(
          text: "녹음",
          selected: _isRecordFilterSelected,
          onSelect: () => setState(() => _isRecordFilterSelected = !_isRecordFilterSelected),
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
                    selected: _filterMonth == month,
                    onTap: () {
                      if (_filterMonth == month) {
                        _filterMonth = null;
                      } else {
                        _filterMonth = month;
                      }
                      setState(() {});
                    },
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
          text: DiaryListOrderType.desc.text,
          selected: _orderType == DiaryListOrderType.desc,
          onSelect: () => setState(() => _orderType = DiaryListOrderType.desc),
        ),
        SizedBox(height: 24.w),
        DiaryRadioButton(
          text: DiaryListOrderType.asc.text,
          selected: _orderType == DiaryListOrderType.asc,
          onSelect: () => setState(() => _orderType = DiaryListOrderType.asc),
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: EdgeInsets.only(
        top: 10.w,
        left: 30.w,
        right: 30.w,
        bottom: 6.w,
      ),
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
              onTap: _onComplete,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResetButton() {
    return GestureDetector(
      onTap: _reset,
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

  void _reset() {
    _isTagFilterSelected = false;
    _isImageFilterSelected = false;
    _isRecordFilterSelected = false;
    _filterMonth = null;
    _orderType = DiaryListOrderType.asc;
    setState(() {});
  }

  void _onComplete() {
    if (_isTagFilterSelected == widget.isTagFilterSelected &&
        _isImageFilterSelected == widget.isImageFilterSelected &&
        _isRecordFilterSelected == widget.isRecordFilterSelected &&
        _filterMonth == widget.filterMonth &&
        _orderType == widget.orderType) {
      context.pop();
      return;
    }

    context.pop(
      (
        isTagFilterSelected: _isTagFilterSelected,
        isImageFilterSelected: _isImageFilterSelected,
        isRecordFilterSelected: _isRecordFilterSelected,
        filterMonth: _filterMonth,
        orderType: _orderType,
      ),
    );
  }
}

class DiarySortBottomSheet extends StatefulWidget {
  final DiaryListOrderType orderType;

  const DiarySortBottomSheet({
    super.key,
    required this.orderType,
  });

  @override
  State<DiarySortBottomSheet> createState() => _DiarySortBottomSheetState();
}

class _DiarySortBottomSheetState extends State<DiarySortBottomSheet> {
  late DiaryListOrderType _orderType;

  @override
  void initState() {
    super.initState();
    _orderType = widget.orderType;
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetFrame(
      title: "정렬 설정하기",
      height: 306.w,
      onComplete: () => context.pop(_orderType),
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
            text: DiaryListOrderType.desc.text,
            selected: _orderType == DiaryListOrderType.desc,
            onSelect: () => _onSelect(DiaryListOrderType.desc),
          ),
          SizedBox(height: 24.w),
          DiaryRadioButton(
            text: DiaryListOrderType.asc.text,
            selected: _orderType == DiaryListOrderType.asc,
            onSelect: () => _onSelect(DiaryListOrderType.asc),
          ),
        ],
      ),
    );
  }

  void _onSelect(DiaryListOrderType orderType) => setState(() => _orderType = orderType);
}
