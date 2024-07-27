import 'dart:async';
import 'dart:io';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nabi_app/enum/diary_type.dart';
import 'package:nabi_app/presentaion/diary/components/diary_write_components.dart';
import 'package:nabi_app/presentaion/diary/diary_write_view_model.dart';
import 'package:nabi_app/utils/permission_request.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/custom_dialog.dart';
import 'package:nabi_app/utils/ui/components/custom_toast.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/components/nabi_calendar.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:provider/provider.dart';

class DiaryWriteView extends StatefulWidget {
  const DiaryWriteView({super.key});

  static const String path = "/diary-write";
  static const String name = "DiaryWriteView";

  @override
  State<DiaryWriteView> createState() => _DiaryWriteViewState();
}

class _DiaryWriteViewState extends State<DiaryWriteView> {
  final FocusNode _focusNode = FocusNode();
  final PlayerController _playerController = PlayerController();

  DiaryWriteViewModel get _viewModel => context.read<DiaryWriteViewModel>();

  @override
  void dispose() {
    _focusNode.dispose();
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      unfocusWhenTap: false,
      appBar: AppBar(
        actions: _actions,
      ),
      body: Selector<DiaryWriteViewModel, bool>(
        selector: (_, viewModel) => viewModel.isLoading,
        builder: (_, isLoading, __) => isLoading
            ? const CustomProgressIndicator()
            : KeyboardVisibilityBuilder(
                builder: (_, isKeyboardVisible) => Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 30.w),
                            _buildDateText(),
                            _buildHashTags(),
                            _buildImages(),
                            _buildAudioPlayer(),
                            SizedBox(height: 24.w),
                            _buildTextField(),
                            SizedBox(height: 24.w),
                          ],
                        ),
                      ),
                    ),
                    isKeyboardVisible ? _buildEditingBar() : _buildNabiDivider(),
                  ],
                ),
              ),
      ),
    );
  }

  List<Widget> get _actions {
    final viewType = context.select<DiaryWriteViewModel, DiaryWriteViewType>(
      (viewModel) => viewModel.viewType,
    );

    if (viewType == DiaryWriteViewType.edit) {
      return [
        OutlinedBorderActionButton(
          text: "저장하기",
          onTap: () {
            _viewModel.onViewTypeChanged(DiaryWriteViewType.readOnly);
          },
        ),
      ];
    }

    if (viewType == DiaryWriteViewType.readOnly) {
      return [
        OutlinedBorderActionButton(
          text: "수정하기",
          activeColor: Colors.black,
          margin: EdgeInsets.only(right: 10.w),
          onTap: () => _viewModel.onViewTypeChanged(DiaryWriteViewType.edit),
        ),
        OutlinedBorderActionButton(
          text: "삭제",
          activeColor: Colors.black,
          onTap: () => showCustomDialog(
            title: "삭제 할까요?",
            subTitle: "열심히 남긴 기억의 조각들이 없어집니다.\n그래도 삭제 할까요?",
            button1Text: "아니요",
            button2Text: "삭제하기",
            onButton2Tap: () => _viewModel.deleteDiary().then(
              (result) {
                if (!result) return;

                context.pop();
              },
            ),
          ),
        ),
      ];
    }

    return [
      Selector<DiaryWriteViewModel, String>(
        selector: (_, viewModel) => viewModel.content,
        builder: (_, content, __) => OutlinedBorderActionButton(
          text: "쓰기 완료",
          onTap: content.isEmpty ? null : () {
            _focusNode.unfocus();
            _viewModel.writeDiary();
          },
        ),
      ),
    ];
  }

  Widget _buildDateText() {
    return Selector<DiaryWriteViewModel, DateTime>(
      selector: (_, viewModel) => viewModel.date,
      builder: (_, date, __) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Text(
          DateFormat("yyyy년 M월 d일 E요일", "ko_KR").format(date),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22.sp,
            height: 1.36,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
      ),
    );
  }

  Widget _buildHashTags() {
    return Selector<DiaryWriteViewModel, List<String>>(
      selector: (_, viewModel) => viewModel.hashTags,
      builder: (_, hashTags, __) => hashTags.isEmpty
          ? const SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 10.w,
              ),
              child: Wrap(
                spacing: 10.w,
                runSpacing: 6.w,
                children: hashTags
                    .map(
                      (hashTag) => Text(
                        "#$hashTag",
                        style: TextStyle(
                          color: color3373F1,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          height: 1,
                          leadingDistribution: TextLeadingDistribution.even,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
    );
  }

  Widget _buildAudioPlayer() {
    return Selector<DiaryWriteViewModel, File?>(
      selector: (_, viewModel) => viewModel.recordFile,
      builder: (context, file, __) => file == null
          ? const SizedBox.shrink()
          : AudioPlayer(
              playerController: _playerController,
              file: file,
              onDeleteTap: _viewModel.deleteRecordFile,
            ),
    );
  }

  Widget _buildImages() {
    return Selector<DiaryWriteViewModel, List<File>>(
      selector: (_, viewModel) => viewModel.images,
      builder: (context, images, __) => images.isEmpty
          ? const SizedBox.shrink()
          : ImageCarouselSlider(
              images: images,
              removeImage: _viewModel.viewType == DiaryWriteViewType.readOnly ? null : _viewModel.removeImage,
            ),
    );
  }

  Widget _buildTextField() {
    return IgnorePointer(
      ignoring: _viewModel.viewType == DiaryWriteViewType.readOnly,
      child: CustomTextField(
        focusNode: _focusNode,
        initialText: _viewModel.content,
        autoFocus: _viewModel.viewType == DiaryWriteViewType.create,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        hintText: "일기 내용을 적어주세요.",
        hintStyle: TextStyle(
          color: colorC6C8CF,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          height: 1.5,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          height: 1.5,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        maxLength: 1000,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        onChanged: _viewModel.onContentChanged,
      ),
    );
  }

  Widget _buildEditingBar() {
    return Container(
      height: 52.w,
      decoration: const BoxDecoration(
        color: colorF6F6F6,
        border: Border(
          top: BorderSide(color: colorCED0D5),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      child: Row(
        children: [
          _buildEditingMenuButton(
            icon: Assets.svg.iconAlbum.svg(
              width: 28.w,
              height: 28.w,
            ),
            onTap: () => _onAlbumTap(),
          ),
          _buildEditingMenuButton(
            icon: Assets.svg.iconMic.svg(
              width: 28.w,
              height: 28.w,
            ),
            onTap: () => _onRecordTap(),
          ),
          _buildEditingMenuButton(
            icon: Assets.svg.iconCalendar.svg(
              width: 28.w,
              height: 28.w,
              colorFilter: const ColorFilter.mode(
                color868693,
                BlendMode.srcIn,
              ),
            ),
            onTap: () => _onCalendarTap(),
          ),
          _buildEditingMenuButton(
            icon: Assets.svg.iconTag.svg(
              width: 28.w,
              height: 28.w,
            ),
            onTap: () => _onHashTagTap(),
          ),
        ],
      ),
    );
  }

  Widget _buildEditingMenuButton({
    required Widget icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 12.w,
        ),
        child: icon,
      ),
    );
  }

  Widget _buildNabiDivider() {
    return SafeArea(
      minimum: EdgeInsets.only(bottom: 16.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        margin: EdgeInsets.only(top: 10.w),
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: colorE3E3E3,
                height: 1,
              ),
            ),
            SizedBox(width: 10.w),
            Assets.svg.iconNabiFilled.svg(),
            SizedBox(width: 10.w),
            Expanded(
              child: Container(
                color: colorE3E3E3,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onAlbumTap() async {
    final isPermissionGranted = await requestPhotoPermission();

    if (!isPermissionGranted) return;

    try {
      if (_viewModel.images.length == 3) {
        showToast(
          message: "이미지는 최대 3개까지 첨부할 수 있어요.",
          bottomPadding: 16.w,
        );
        return;
      }

      _focusNode.unfocus();

      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        requestFullMetadata: false,
      );

      _viewModel.addImage(image);
    } catch (e) {
      showToast(
        message: "이미지를 불러오는데 실패했습니다.",
        bottomPadding: 16.w,
      );
    } finally {
      _focusNode.requestFocus();
    }
  }

  Future<void> _onRecordTap() async {
    _playerController.pausePlayer();

    final result = await showModalBottomSheet<File>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const VoiceRecordBottomSheet(),
    );

    _viewModel.onRecordFileChanged(result);
  }

  Future<void> _onCalendarTap() async {
    final result = await showCalendarBottomSheet(
      context,
      selectedDay: _viewModel.date,
      title: "날짜 재설정 하기",
    );

    _viewModel.onDateChanged(result);
  }

  Future<void> _onHashTagTap() async {
    final result = await showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => HashTagBottomSheet(
        hashTags: _viewModel.hashTags,
      ),
    );

    _viewModel.onHashTagsChanged(result);
  }
}
