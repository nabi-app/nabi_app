import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'dart:async';
import 'dart:io';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:nabi_app/utils/permission_request.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:path_provider/path_provider.dart';

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
    return KeyboardVisibilityBuilder(
      builder: (_, isKeyboardVisible) => GestureDetector(
        onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
        child: BottomSheetFrame(
          title: "태그 입력 하기",
          completeButtonText: isKeyboardVisible ? null : "태그 입력 하기",
          onComplete: () => context.pop(_hashTags),
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                _buildHashTags(isKeyboardVisible),
              ],
            ),
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
      suffixIcon: GestureDetector(
        onTap: () {
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
      ),
      suffixConstraints: BoxConstraints(
        maxWidth: 62.w,
        maxHeight: 32.w,
      ),
    );
  }

  Widget _buildHashTags(bool isKeyboardVisible) {
    return SizedBox(
      height: isKeyboardVisible ? 150.w : 316.w,
      child: ListView.separated(
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
  final PlayerController playerController;
  const VoiceRecordBottomSheet({super.key, required this.playerController,});

  @override
  State<VoiceRecordBottomSheet> createState() => _VoiceRecordBottomSheetState();
}

class _VoiceRecordBottomSheetState extends State<VoiceRecordBottomSheet> {
  final RecorderController _recorderController = RecorderController()
    ..androidEncoder = AndroidEncoder.aac
    ..androidOutputFormat = AndroidOutputFormat.mpeg4
    ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC;
  late StreamSubscription<Duration> _recorderDurationSubscription;

  late final PlayerController _playerController = widget.playerController;
  late StreamSubscription<int> _playerDurationSubscription;
  late StreamSubscription _playerCompletionSubscription;

  late final Directory _appDirectory;
  late final String _filePath;
  int _playerRemainSeconds = 0;
  bool _recordCompleted = false;

  @override
  void initState() {
    super.initState();
    _setDirectory();

    _recorderDurationSubscription = _recorderController.onCurrentDuration.listen(
          (duration) {
        if (duration.inMilliseconds % 1000 == 0) {
          setState(() {});
        }
      },
    );

    _playerDurationSubscription = _playerController.onCurrentDurationChanged.listen(
          (duration) {
        _playerRemainSeconds = (_recorderController.recordedDuration.inMilliseconds - duration) ~/ 1000;
        setState(() {});
      },
    );

    _playerCompletionSubscription = _playerController.onCompletion.listen(
          (_) => _stopPlay(),
    );
  }

  Future<void> _setDirectory() async {
    _appDirectory = await getApplicationDocumentsDirectory();
    _filePath = "${_appDirectory.path}/record.m4a";
  }

  @override
  void dispose() {
    _recorderController.dispose();
    // _playerController.dispose();
    _recorderDurationSubscription.cancel();
    _playerDurationSubscription.cancel();
    _playerCompletionSubscription.cancel();
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
    if (_recorderController.isRecording) {
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
      _generateTimeText(_recorderController.elapsedDuration.inSeconds),
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

    if (_playerController.playerState.isPlaying) {
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
                _generateTimeText(_playerRemainSeconds),
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
              _generateTimeText(_playerController.maxDuration ~/ 1000),
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
    final isPermissionGranted = await requestMicPermission();

    if (!isPermissionGranted) return;

    _recordCompleted = false;

    if (_playerController.playerState.isPlaying) {
      await _playerController.stopPlayer();
    }

    await _recorderController.record(path: _filePath);

    setState(() {});
  }

  Future<void> _stopRecord() async {
    _recordCompleted = true;

    await _recorderController.stop();

    await _playerController.preparePlayer(
      path: _filePath,
      shouldExtractWaveform: false,
    );

    setState(() {});
  }

  Future<void> _startPlay() async {
    try {
      _playerRemainSeconds = _recorderController.recordedDuration.inSeconds;

      await _playerController.preparePlayer(
        path: _filePath,
        shouldExtractWaveform: false,
      );

      await _playerController.startPlayer();

      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stopPlay() async {
    await _playerController.stopPlayer();

    setState(() {});
  }

  Future<void> _deleteRecord() async {
    if (_playerController.playerState.isPlaying) {
      await _playerController.stopPlayer();
    }

    _recordCompleted = false;

    setState(() {});
  }
}
