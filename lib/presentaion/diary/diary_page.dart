import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/domain/model/diary_item_data.dart';
import 'package:nabi_app/enum/diary_type.dart';
import 'package:nabi_app/presentaion/diary/components/diary_components.dart';
import 'package:nabi_app/presentaion/diary/diary_page_view_model.dart';
import 'package:nabi_app/presentaion/diary/diary_write_view.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/utils/throttle.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:provider/provider.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  static const String path = "/diary";
  static const String name = "DiaryPage";

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  final ScrollController _scrollController = ScrollController();
  final Throttle _throttle = Throttle(duration: const Duration(milliseconds: 1500));

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollCallback);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _throttle.dispose();
    super.dispose();
  }

  void _scrollCallback() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
      _throttle.run(context.read<DiaryPageViewModel>().fetch);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildFilterButtons(),
        _buildSortButton(),
        Expanded(
          child: _buildDiaryList(),
        ),
      ],
    );
  }

  Widget _buildFilterButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8.w,
        runSpacing: 8.w,
        children: [
          DiaryFilterButton(
            icon: Assets.svg.iconFilter.svg(width: 20.w, height: 20.w),
            onTap: () => _onFilterTap(context),
          ),
          Selector<DiaryPageViewModel, bool>(
            selector: (_, viewModel) => viewModel.isTagFilterSelected,
            builder: (_, isTagFilterSelected, __) => DiaryFilterButton(
              text: "태그",
              selected: isTagFilterSelected,
              onTap: () => _onFilterTap(context),
            ),
          ),
          Selector<DiaryPageViewModel, bool>(
            selector: (_, viewModel) => viewModel.isImageFilterSelected,
            builder: (_, isImageFilterSelected, __) => DiaryFilterButton(
              text: "이미지",
              selected: isImageFilterSelected,
              onTap: () => _onFilterTap(context),
            ),
          ),
          Selector<DiaryPageViewModel, bool>(
            selector: (_, viewModel) => viewModel.isRecordFilterSelected,
            builder: (_, isRecordFilterSelected, __) => DiaryFilterButton(
              text: "녹음",
              selected: isRecordFilterSelected,
              onTap: () => _onFilterTap(context),
            ),
          ),
          Selector<DiaryPageViewModel, int?>(
            selector: (_, viewModel) => viewModel.filterMonth,
            builder: (_, filterMonth, __) => DiaryFilterButton(
              text: "월별",
              selected: filterMonth != null,
              onTap: () => _onFilterTap(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortButton() {
    return Selector<DiaryPageViewModel, DiaryListOrderType>(
      selector: (_, viewModel) => viewModel.orderType,
      builder: (context, orderType, __) => GestureDetector(
        onTap: () => _onSortTap(context),
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                orderType.text,
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
      ),
    );
  }

  Widget _buildDiaryList() {
    return Selector<DiaryPageViewModel, List<DiaryItemData>?>(
      selector: (_, viewModel) => viewModel.items,
      builder: (_, items, __) => items == null
          ? const CustomProgressIndicator()
          : items.isEmpty
              ? _buildEmptyMessage()
              : ListView.separated(
                  controller: _scrollController,
                  itemCount: items.length,
                  padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 20.w),
                  separatorBuilder: (_, __) => SizedBox(height: 20.w),
                  itemBuilder: (_, index) {
                    final item = items[index];

                    return DiaryItemCard(
                      item: item,
                      onTap: () => context.pushNamed(DiaryWriteView.name, extra: item),
                    );
                  },
                ),
    );
  }

  Widget _buildEmptyMessage() {
    final textStyle = TextStyle(
      color: color999DAC,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      height: 1.25,
      leadingDistribution: TextLeadingDistribution.even,
    );

    return Padding(
      padding: EdgeInsets.only(top: 177.w),
      child: Column(
        children: [
          Text(
            "작성한 일기가 없어요.",
            style: textStyle,
          ),
          SizedBox(height: 10.w),
          Text(
            "+ 버튼으로 일기작성을 시작해보세요!",
            style: textStyle,
          ),
        ],
      ),
    );
  }

  Future<void> _onFilterTap(BuildContext context) async {
    final viewModel = context.read<DiaryPageViewModel>();

    final result = await showModalBottomSheet(
      context: rootContext!,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => DiaryFilterBottomSheet(
        isTagFilterSelected: viewModel.isTagFilterSelected,
        isImageFilterSelected: viewModel.isImageFilterSelected,
        isRecordFilterSelected: viewModel.isRecordFilterSelected,
        filterMonth: viewModel.filterMonth,
        orderType: viewModel.orderType,
      ),
    );

    viewModel.onFilterChanged(result);
  }

  Future<void> _onSortTap(BuildContext context) async {
    final viewModel = context.read<DiaryPageViewModel>();

    final result = await showModalBottomSheet(
      context: rootContext!,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => DiarySortBottomSheet(orderType: viewModel.orderType),
    );

    viewModel.onOrderTypeChanged(result);
  }
}
