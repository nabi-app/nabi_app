import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/presentaion/diary/diary_write_image_detail_view.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'dart:async';
import 'dart:io';
import 'package:nabi_app/utils/ui/components/custom_toast.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:nabi_app/utils/permission_request.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:audioplayers/audioplayers.dart';

class ImageCarouselSlider extends StatefulWidget {
  final List<File> images;
  final Function(int index)? removeImage;

  const ImageCarouselSlider({
    super.key,
    required this.images,
    this.removeImage,
  });

  @override
  State<ImageCarouselSlider> createState() => _ImageCarouselSliderState();
}

class _ImageCarouselSliderState extends State<ImageCarouselSlider> {
  int _page = 1;

  bool get _editable => widget.removeImage != null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.w, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorF6F6F6,
      ),
      child: Stack(
        children: [
          _buildImageSlider(widget.images),
          _buildCloseButton(),
          _buildPageIndicator(widget.images.length),
        ],
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
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    if (!_editable) return const SizedBox.shrink();

    return Positioned(
      top: 12.w,
      right: 12.w,
      child: GestureDetector(
        onTap: () {
          widget.removeImage!(_page - 1);

          if (widget.images.length != _page) return;

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

class AudioPlayer extends StatefulWidget {
  final PlayerController playerController;
  final File file;
  final VoidCallback? onDeleteTap;

  const AudioPlayer({
    super.key,
    required this.playerController,
    required this.file,
    this.onDeleteTap,
  });

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  late PlayerController _playerController;
  StreamSubscription? _playerCompletionSubscription;
  StreamSubscription<int>? _playerDurationSubscription;

  List<double>? _waveFormData;

  bool _isLoading = true;
  int _playerTimeSeconds = 0;
  int _playerRemainSeconds = 0;

  bool get _editable => widget.onDeleteTap != null;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    _playerController = widget.playerController;

    _isLoading = true;
    setState(() {});

    await _playerController.preparePlayer(
      path: widget.file.path,
      noOfSamples: 17,
    );

    _waveFormData = _playerController.waveformData;
    _playerTimeSeconds = _playerController.maxDuration;
    _playerRemainSeconds = _playerController.maxDuration;

    _isLoading = false;
    setState(() {});

    _playerDurationSubscription ??= _playerController.onCurrentDurationChanged.listen(
      (duration) {
        _playerRemainSeconds = _playerTimeSeconds - duration;
        setState(() {});
      },
    );

    _playerCompletionSubscription ??= _playerController.onCompletion.listen(
      (_) async {
        await _playerController.stopPlayer();
        await _playerController.preparePlayer(
          path: widget.file.path,
          noOfSamples: 17,
        );
        _playerRemainSeconds = _playerTimeSeconds;
        setState(() {});
      },
    );
  }

  @override
  void didUpdateWidget(covariant AudioPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.file.hashCode != widget.file.hashCode) {
      _initPlayer();
    }
  }

  @override
  void dispose() {
    _playerDurationSubscription?.cancel();
    _playerCompletionSubscription?.cancel();
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
        liveWaveColor: color233067,
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
    if (!_editable) return const SizedBox.shrink();

    return Positioned(
      top: 10.w,
      right: 10.w,
      child: GestureDetector(
        onTap: () async {
          await _playerController.stopPlayer();
          widget.onDeleteTap!();
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

class HashTagBottomSheet extends StatefulWidget {
  final List<String> hashTags;

  const HashTagBottomSheet({super.key, required this.hashTags});

  @override
  State<HashTagBottomSheet> createState() => _HashTagBottomSheetState();
}

class _HashTagBottomSheetState extends State<HashTagBottomSheet> {
  final TextEditingController _textEditingController = TextEditingController();
  late final List<String> _hashTags;

  @override
  void initState() {
    super.initState();
    _hashTags = List.from(widget.hashTags);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
      child: BottomSheetFrame(
        title: "태그 입력 하기",
        completeButtonText: "태그 입력 하기",
        onComplete: () => context.pop(_hashTags),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 30.w),
              _buildTextField(),
              Container(
                color: colorE4E7ED,
                height: 1,
              ),
              _buildHashTags(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return CustomTextField(
      controller: _textEditingController,
      hintText: "태그를 입력해주세요.",
      hintStyle: TextStyle(
        color: colorC6C8CF,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        height: 1.375,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        height: 1.375,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      maxLines: 1,
      contentPadding: EdgeInsets.symmetric(vertical: 15.w),
      prefixIcon: _buildHashTagIcon(),
      prefixConstraints: BoxConstraints(maxWidth: 16.w),
      suffixIcon: _buildAddButton(),
      suffixConstraints: BoxConstraints(
        maxWidth: 62.w,
        maxHeight: 32.w,
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (_textEditingController.text.isEmpty) return;

        if (_hashTags.length == 5) {
          showToast(message: "태그는 최대 5개까지 추가할 수 있어요.");
          return;
        }

        final text = _textEditingController.text;

        if (text.isEmpty) return;

        _textEditingController.clear();
        _hashTags.add(text);
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.only(left: 10.w),
        alignment: Alignment.center,
        child: Text(
          "추가",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            height: 1,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
      ),
    );
  }

  Widget _buildHashTags() {
    return SizedBox(
      height: 316.w,
      child: ListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.only(top: 10.w, bottom: 16.w),
        itemCount: _hashTags.length,
        separatorBuilder: (_, __) => SizedBox(height: 12.w),
        itemBuilder: (_, index) => Row(
          children: [
            _buildHashTagIcon(),
            Expanded(
              child: Text(
                _hashTags[index],
                style: TextStyle(
                  color: color3373F1,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  height: 1.375,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _hashTags.removeWhere((hashTag) => hashTag == _hashTags[index]);
                setState(() {});
              },
              behavior: HitTestBehavior.translucent,
              child: Padding(
                padding: EdgeInsets.only(left: 12.w, right: 16.w),
                child: Assets.svg.iconClose.svg(
                  width: 10.w,
                  height: 10.w,
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHashTagIcon() {
    return Padding(
      padding: EdgeInsets.only(right: 6.w),
      child: Text(
        "#",
        style: TextStyle(
          color: color3373F1,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          height: 1.375,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }
}

class VoiceRecordBottomSheet extends StatefulWidget {
  const VoiceRecordBottomSheet({
    super.key,
  });

  @override
  State<VoiceRecordBottomSheet> createState() => _VoiceRecordBottomSheetState();
}

class _VoiceRecordBottomSheetState extends State<VoiceRecordBottomSheet> {
  late final AudioRecorder _recorder;
  RecordState _recordState = RecordState.stop;
  StreamSubscription<RecordState>? _recorderStateSubscription;
  late final String _filePath;
  Timer? _recordTimer;
  int _recordTime = 0;

  ap.AudioPlayer? _player;
  StreamSubscription<Duration>? _playerPositionSubscription;
  StreamSubscription<ap.PlayerState>? _playerStateSubscription;
  int _playerTime = 0;
  int _playerRemainTime = 0;

  bool _recordCompleted = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final isGranted = await requestMicPermission();

    if (!isGranted) return;

    await _setDirectory();

    _initRecorder();
  }

  Future<void> _setDirectory() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    _filePath = "${appDirectory.path}/record.m4a";
  }

  void _initRecorder() {
    _recorder = AudioRecorder();

    _recorderStateSubscription = _recorder.onStateChanged().listen(
      (state) {
        if (state == RecordState.stop) _initPlayer();

        _recordState = state;
        setState(() {});
      },
    );
  }

  Future<void> _initPlayer() async {
    _player = ap.AudioPlayer()..setReleaseMode(ReleaseMode.stop);

    await _player!.setSourceDeviceFile(_filePath);

    _playerStateSubscription = _player!.onPlayerStateChanged.listen(
      (_) => setState(() {}),
    );

    _playerPositionSubscription = _player!.onPositionChanged.listen(
      (duration) {
        final calculatedSeconds = _playerTime - duration.inSeconds;

        if (_playerRemainTime == calculatedSeconds) return;

        _playerRemainTime = calculatedSeconds;
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _recorderStateSubscription?.cancel();
    _playerStateSubscription?.cancel();
    _playerPositionSubscription?.cancel();
    _recorder.dispose();
    _player?.dispose();
    _recordTimer?.cancel();
    super.dispose();
  }

  String _generateTimeText(int timeSeconds) {
    final minutes = timeSeconds ~/ 60;
    final seconds = timeSeconds - minutes * 60;

    return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetFrame(
      title: "녹음하기",
      completeButtonText: "녹음 추가하기",
      onComplete: _recordCompleted ? () => context.pop(File(_filePath)) : null,
      child: Column(
        children: [
          SizedBox(height: 80.w),
          _buildStartRecordText(),
          SizedBox(height: 20.w),
          _buildRecordControlButton(),
          SizedBox(height: 20.w),
          _buildRecordTimeText(),
          SizedBox(
            height: 140.w,
            child: Column(
              children: [
                const Spacer(flex: 4),
                _buildAudioPlayArea(),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartRecordText() {
    return Text(
      "탭하여 녹음 시작하기",
      style: TextStyle(
        color: color999DAC,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        height: 1,
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: -0.48,
      ),
    );
  }

  Widget _buildRecordControlButton() {
    if (_recordState == RecordState.record) {
      return GestureDetector(
        onTap: _stopRecord,
        child: AvatarGlow(
          glowColor: colorFFDADA,
          repeat: true,
          animate: true,
          glowCount: 2,
          glowRadiusFactor: 0.4,
          child: _buildRecordControlButtonFrame(
            icon: Container(
              width: 27.w,
              height: 27.w,
              color: Colors.red,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: _startRecord,
      child: _buildRecordControlButtonFrame(
        icon: Assets.svg.iconMic.svg(
          width: 43.w,
          height: 50.w,
          colorFilter: const ColorFilter.mode(
            Colors.red,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  Widget _buildRecordControlButtonFrame({required Widget icon}) {
    return Container(
      height: 120.w,
      width: 120.w,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: colorFFDADA,
      ),
      child: icon,
    );
  }

  Widget _buildRecordTimeText() {
    return Text(
      _generateTimeText(_recordTime),
      style: TextStyle(
        color: color999DAC,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        height: 1,
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: -0.48,
      ),
    );
  }

  Widget _buildAudioPlayArea() {
    if (!_recordCompleted) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAudioPlayButton(),
        SizedBox(width: 6.w),
        _buildDeleteButton(),
      ],
    );
  }

  Widget _buildAudioPlayButton() {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      height: 1,
      leadingDistribution: TextLeadingDistribution.even,
      letterSpacing: -0.48,
      fontFeatures: const [
        FontFeature.tabularFigures(),
      ],
    );

    if (_player!.state == ap.PlayerState.playing) {
      return GestureDetector(
        onTap: _stopPlay,
        child: Container(
          height: 40.w,
          constraints: BoxConstraints(minWidth: 177.w),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 30.w,
                height: 20.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  width: 8.w,
                  height: 8.w,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                "그만 듣기",
                style: textStyle,
              ),
              SizedBox(width: 10.w),
              Text(
                _generateTimeText(_playerRemainTime),
                style: textStyle,
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: _startPlay,
      child: Container(
        height: 40.w,
        constraints: BoxConstraints(minWidth: 177.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 30.w,
              height: 20.w,
              padding: EdgeInsets.only(left: 12.w, right: 8.w),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Assets.svg.iconPlay.svg(
                width: 10.w,
                height: 10.w,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              "녹음 듣기",
              style: textStyle,
            ),
            SizedBox(width: 10.w),
            Text(
              _generateTimeText(_playerTime),
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: _deleteRecord,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
        ),
        alignment: Alignment.center,
        child: Assets.svg.iconClose.svg(
          width: 12.w,
          height: 12.w,
          colorFilter: const ColorFilter.mode(
            Colors.black,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  Future<void> _startRecord() async {
    _recordCompleted = false;

    await _player?.stop();

    await _recorder.start(
      const RecordConfig(encoder: AudioEncoder.aacLc),
      path: _filePath,
    );

    _startRecordTimer();
  }

  Future<void> _stopRecord() async {
    _recordCompleted = true;

    await _recorder.stop();

    _stopRecordTimer();
  }

  Future<void> _startPlay() async {
    await _player!.play(ap.DeviceFileSource(_filePath));
  }

  Future<void> _stopPlay() async {
    await _player!.stop();
  }

  Future<void> _deleteRecord() async {
    _recordCompleted = false;
    setState(() {});
  }

  void _startRecordTimer() {
    _recordTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() => _recordTime += 1),
    );
  }

  void _stopRecordTimer() {
    _playerTime = _recordTime;

    _recordTimer!.cancel();
    _recordTime = 0;

    setState(() {});
  }
}
