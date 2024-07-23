import 'dart:async';
import 'dart:io';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nabi_app/presentaion/diary/diary_write_view_model.dart';
import 'package:nabi_app/utils/permission_request.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/components/nabi_calendar.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:provider/provider.dart';

import 'components/diary_write_components.dart';

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
      body: KeyboardVisibilityBuilder(builder: (_, isKeyboardVisible) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 30.w),
                    _buildDateText(),
                    _buildHashTags(),
                    _buildRecordPlayer(),
                    _buildImages(),
                    SizedBox(height: 24.w),
                    _buildTextField(context),
                    SizedBox(height: 24.w),
                  ],
                ),
              ),
            ),
            isKeyboardVisible ? _buildEditingBar(context) : _buildNabiDivider(),
          ],
        );
      }),
    );
  }

  List<Widget> get _actions {
    return [
      Selector<DiaryWriteViewModel, String>(
        selector: (_, viewModel) => viewModel.content,
        builder: (_, content, __) => OutlinedBorderActionButton(
          text: "쓰기 완료",
          onTap: content.isEmpty ? null : () {},
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

  Widget _buildRecordPlayer() {
    return Selector<DiaryWriteViewModel, File?>(
      selector: (_, viewModel) => viewModel.recordFile,
      builder: (context, file, __) => file == null
          ? const SizedBox.shrink()
          : RecordPlayer(
              playerController: _playerController,
              file: file,
              onDeleteTap: context.read<DiaryWriteViewModel>().deleteRecordFile,
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
              removeImage: context.read<DiaryWriteViewModel>().removeImage,
            ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return CustomTextField(
      initialText: context.read<DiaryWriteViewModel>().content,
      focusNode: _focusNode,
      autoFocus: true,
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
      onChanged: context.read<DiaryWriteViewModel>().onContentChanged,
    );
  }

  Widget _buildEditingBar(BuildContext context) {
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
            onTap: () => _onAlbumTap(context),
          ),
          _buildEditingMenuButton(
            icon: Assets.svg.iconMic.svg(
              width: 28.w,
              height: 28.w,
            ),
            onTap: () => _onRecordTap(context),
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
            onTap: () => _onCalendarTap(context),
          ),
          _buildEditingMenuButton(
            icon: Assets.svg.iconTag.svg(
              width: 28.w,
              height: 28.w,
            ),
            onTap: () => _onHashTagTap(context),
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

  Future<void> _onAlbumTap(BuildContext context) async {
    _focusNode.unfocus();

    final viewModel = context.read<DiaryWriteViewModel>();

    final isPermissionGranted = await requestPhotoPermission();

    if (!isPermissionGranted) return;

    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        requestFullMetadata: false,
      );

      viewModel.addImage(image);

      _focusNode.requestFocus();
    } catch (e) {
      showToast(message: "이미지를 불러오는데 실패했습니다.");
    }
  }

  Future<void> _onRecordTap(BuildContext context) async {
    if (_playerController.playerState.isPlaying) _playerController.pausePlayer();

    final viewModel = context.read<DiaryWriteViewModel>();

    final result = await showModalBottomSheet<File>(
      context: context,
      isScrollControlled: true,
      builder: (_) => VoiceRecordBottomSheet(
        playerController: _playerController,
      ),
    );

    viewModel.onRecordFileChanged(result);
  }

  Future<void> _onCalendarTap(BuildContext context) async {
    final viewModel = context.read<DiaryWriteViewModel>();

    final result = await showCalendarBottomSheet(
      context,
      selectedDay: viewModel.date,
      title: "날짜 재설정 하기",
    );

    viewModel.onDateChanged(result);
  }

  Future<void> _onHashTagTap(BuildContext context) async {
    final viewModel = context.read<DiaryWriteViewModel>();

    final result = await showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => HashTagBottomSheet(
        hashTags: viewModel.hashTags,
      ),
    );

    viewModel.onHashTagsChanged(result);
  }
}
