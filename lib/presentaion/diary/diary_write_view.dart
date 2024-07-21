import 'dart:async';
import 'dart:io';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nabi_app/presentaion/diary/diary_write_image_detail_view.dart';
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
      builder: (_, file, __) => file == null
          ? const SizedBox.shrink()
          : _RecordPlayer(
              playerController: _playerController,
              file: file,
            ),
    );
  }

  Widget _buildImages() {
    return const _ImageCarouselSlider();
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

class _RecordPlayer extends StatefulWidget {
  final PlayerController playerController;
  final File file;

  const _RecordPlayer({
    required this.playerController,
    required this.file,
  });

  @override
  State<_RecordPlayer> createState() => _RecordPlayerState();
}

class _RecordPlayerState extends State<_RecordPlayer> {
  late final PlayerController _playerController = widget.playerController;
  late StreamSubscription _playerCompletionSubscription;
  late StreamSubscription<int> _playerDurationSubscription;
  List<double>? _waveFormData;
  bool _isLoading = true;
  int _playerTimeSeconds = 0;
  int _playerRemainSeconds = 0;

  @override
  void initState() {
    super.initState();
    _initPlayer();

    _playerDurationSubscription = _playerController.onCurrentDurationChanged.listen(
      (duration) {
        _playerRemainSeconds = _playerTimeSeconds - duration;
        setState(() {});
      },
    );

    _playerCompletionSubscription = _playerController.onCompletion.listen(
      (_) async {
        await _playerController.stopPlayer();
        await _playerController.preparePlayer(path: widget.file.path);
        _playerRemainSeconds = _playerTimeSeconds;
        setState(() {});
      },
    );
  }

  Future<void> _initPlayer() async {
    _isLoading = true;
    setState(() {});

    await _playerController.preparePlayer(path: widget.file.path, noOfSamples: 17);
    _waveFormData = _playerController.waveformData;
    _playerTimeSeconds = _playerController.maxDuration;
    _playerRemainSeconds = _playerController.maxDuration;

    _isLoading = false;
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant _RecordPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.file.hashCode != widget.file.hashCode) {
      _initPlayer();
    }
  }

  @override
  void dispose() {
    _playerDurationSubscription.cancel();
    _playerCompletionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(top: 10.w, left: 16.w, right: 16.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildAudioWaveForms(),
          _buildAudioDurationText(),
          _buildPlayButton(),
          _buildDeleteButton(context),
        ],
      ),
    );
  }

  Widget _buildAudioWaveForms() {
    return AudioFileWaveforms(
      size: Size(343.w, 68.w),
      padding: EdgeInsets.only(
        left: 47.w,
        top: 10.w,
        bottom: 10.w,
      ),
      decoration: BoxDecoration(
        color: colorE5EAF7,
        borderRadius: BorderRadius.circular(12),
      ),
      playerController: _playerController,
      waveformData: _waveFormData ?? [],
      waveformType: WaveformType.fitWidth,
      playerWaveStyle: PlayerWaveStyle(
        fixedWaveColor: colorC5CFF2,
        liveWaveColor: Colors.blueAccent,
        spacing: 13.5.w,
        waveThickness: 6.w,
        scaleFactor: 300,
      ),
    );
  }

  Widget _buildAudioDurationText() {
    final toSeconds = _playerRemainSeconds ~/ 1000;
    final minutes = toSeconds ~/ 60;
    final seconds = toSeconds - (minutes * 60);

    return Positioned(
      right: 12.w,
      child: Text(
        "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}",
        style: TextStyle(
          color: color999DAC,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }

  Widget _buildPlayButton() {
    if (_playerController.playerState.isPlaying) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () async {
        await _playerController.startPlayer();
        setState(() {});
      },
      child: Container(
        width: 50.w,
        height: 34.w,
        padding: EdgeInsets.only(left: 20.w, right: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Assets.svg.iconPlay.svg(
          width: 18.w,
          height: 18.w,
        ),
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return Positioned(
      top: 10.w,
      right: 10.w,
      child: GestureDetector(
        onTap: () async {
          final viewModel = context.read<DiaryWriteViewModel>();
          await _playerController.stopPlayer();
          viewModel.deleteRecordFile();
        },
        child: Container(
          width: 18.w,
          height: 18.w,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Assets.svg.iconClose.svg(
            width: 8.w,
            height: 8.w,
            colorFilter: const ColorFilter.mode(
              Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageCarouselSlider extends StatefulWidget {
  const _ImageCarouselSlider();

  @override
  State<_ImageCarouselSlider> createState() => _ImageCarouselSliderState();
}

class _ImageCarouselSliderState extends State<_ImageCarouselSlider> {
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Selector<DiaryWriteViewModel, List<File>>(
      selector: (_, viewModel) => viewModel.images,
      builder: (_, images, __) => images.isEmpty
          ? const SizedBox.shrink()
          : Container(
              margin: EdgeInsets.only(top: 10.w, left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colorF6F6F6,
              ),
              child: Stack(
                children: [
                  _buildImageSlider(images),
                  _buildCloseButton(),
                  _buildPageIndicator(images.length),
                ],
              ),
            ),
    );
  }

  Widget _buildImageSlider(List<File> images) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
          viewportFraction: 1,
          aspectRatio: 1.9056,
          enableInfiniteScroll: false,
          onPageChanged: (page, _) {
            _page = page + 1;
            setState(() {});
          },
        ),
        itemBuilder: (_, index, __) => _buildImage(
          images: images,
          index: index,
        ),
      ),
    );
  }

  Widget _buildImage({
    required List<File> images,
    required int index,
  }) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        DiaryWriteImageDetailView.name,
        extra: (images: images, index: index),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(images[index]),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return Positioned(
      top: 12.w,
      right: 12.w,
      child: GestureDetector(
        onTap: () {
          final viewModel = context.read<DiaryWriteViewModel>();

          viewModel.removeImage(_page - 1);

          if (viewModel.images.isEmpty) return;

          if (viewModel.images.length >= _page) return;

          _page -= 1;
        },
        child: Container(
          width: 18.w,
          height: 18.w,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Assets.svg.iconClose.svg(
            width: 8.w,
            height: 8.w,
            colorFilter: const ColorFilter.mode(
              Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int itemCount) {
    return Positioned(
      left: 12.w,
      bottom: 12.w,
      child: Container(
        width: 39.w,
        height: 22.w,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: Text(
          "$_page/$itemCount",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            height: 1,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
      ),
    );
  }
}
