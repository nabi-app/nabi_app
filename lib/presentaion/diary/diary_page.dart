import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:nabi_app/domain/model/diary_list_response.dart';
import 'package:nabi_app/presentaion/diary/components/diary_components.dart';
import 'package:nabi_app/presentaion/diary/diary_page_view_model.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:provider/provider.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});

  static const String path = "/diary";
  static const String name = "DiaryPage";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildFilterButtons(context),
        _buildSortButton(context),
        Expanded(
          child: _buildDiaryList(),
        ),
      ],
    );
  }

  Widget _buildFilterButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8.w,
        runSpacing: 8.w,
        children: [
          DiaryFilterButton(
            icon: Assets.svg.iconFilter.svg(width: 20.w, height: 20.w),
            selected: true,
            onTap: () => _onFilterTap(context),
          ),
          DiaryFilterButton(
            text: "태그",
            selected: true,
            onTap: () => _onFilterTap(context),
          ),
          DiaryFilterButton(
            text: "이미지",
            selected: true,
            onTap: () => _onFilterTap(context),
          ),
          DiaryFilterButton(
            text: "녹음",
            selected: false,
            onTap: () => _onFilterTap(context),
          ),
          DiaryFilterButton(
            text: "월별",
            selected: false,
            onTap: () => _onFilterTap(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSortButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _onSortTap(context),
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "최신순",
              style: TextStyle(
                color: color233067,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                height: 1,
                leadingDistribution: TextLeadingDistribution.even,
              ),
            ),
            SizedBox(width: 4.w),
            Assets.svg.iconSort.svg(
              width: 22.w,
              height: 22.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiaryList() {
    return Selector<DiaryPageViewModel, List<DiaryItemData>?>(
      selector: (_, viewModel) => viewModel.items,
      builder: (_, items, __) => items == null
          ? const Center(
              child: CircularProgressIndicator(color: color233067),
            )
          : ListView.separated(
              itemCount: items.length,
              padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 20.w),
              separatorBuilder: (_, __) => SizedBox(height: 20.w),
              itemBuilder: (_, index) => _DiaryItemCard(
                item: items[index],
                onTap: () {},
              ),
            ),
    );
  }

  Future<void> _onFilterTap(BuildContext context) async {
    showModalBottomSheet(
      context: rootContext!,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => DiaryFilterBottomSheet(),
    );
  }

  Future<void> _onSortTap(BuildContext context) async {
    showModalBottomSheet(
      context: rootContext!,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => DiarySortBottomSheet(),
    );
  }
}

class _DiaryItemCard extends StatelessWidget {
  final DiaryItemData item;
  final VoidCallback onTap;

  const _DiaryItemCard({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(14.w, 14.w, 14.w, 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
    );
  }

  Widget _buildRepresentaionImage() {
    if (item.images?.isEmpty ?? true) return const SizedBox.shrink();

    return Container(
      height: 168.w,
      margin: EdgeInsets.only(bottom: 14.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
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
        if (item.records?.isNotEmpty ?? false) ...[
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
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: icon,
    );
  }

  Widget _buildContent() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        item.description,
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
