import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MusicRecommendDetailView extends StatelessWidget {
  const MusicRecommendDetailView({super.key});

  static const String path = "/music-recommend/detail";
  static const String name = "MusicRecommendDetailView";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: _HeaderDelegate(
              child: _buildHeader(context),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 30.w,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.w),
                  _buildMessageTitle(),
                  SizedBox(height: 10.w),
                  _buildMessage(),
                  SizedBox(height: 50.w),
                  _buildMusicRecommendTitle(),
                  _buildMusicList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 452,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://nabi-s3-bucket.s3.ap-northeast-2.amazonaws.com/nabi_diary_image/89_19_image_picker_FBF9FCCF-E070-4E35-A874-E0EEBF346DC9-61117-00000B0907B2DDE1.jpg",
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: context.pop,
              behavior: HitTestBehavior.translucent,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 7.w,
                  top: MediaQuery.of(context).padding.top,
                ),
                child: Assets.svg.iconArrowLeft.svg(
                  width: 38,
                  height: 38,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: 30.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "플레이스트 이름",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      height: 1.5,
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Wrap(
                    spacing: 10.w,
                    runSpacing: 10.w,
                    alignment: WrapAlignment.start,
                    children: [
                      _buildOutlinedFilter(),
                      _buildOutlinedFilter(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutlinedFilter() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 11.w,
        vertical: 5.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white),
      ),
      child: Text(
        "에너지",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }

  Widget _buildMessageTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        "메시지",
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

  Widget _buildMessage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        "목표달성이 힘든가요? 그럴수 있죠! 그래도 우리는 계속 가야합니다. 지치고 힘든 그대에게 이 플레이리스트를 선물합니다.",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          height: 1.5625,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }

  Widget _buildMusicRecommendTitle() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.only(bottom: 14.w),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorE4E7ED),
        ),
      ),
      child: Text(
        "추천음악 들어보기",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }

  Widget _buildMusicList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          _MusicExpansionPanel(
            musicName: "Good Luck, Babe",
            singerName: "Chappell Roan",
            link: "https://www.youtube.com/watch?v=1RKqOmSkGgM",
          ),
          _MusicExpansionPanel(
            musicName: "Drop",
            singerName: "The Pharcyde",
            link: "https://www.youtube.com/watch?v=wqVsfGQ_1SU",
          ),
          _MusicExpansionPanel(
            musicName: "Good Luck, Babe",
            singerName: "Chappell Roan",
            link: "https://www.youtube.com/watch?v=1RKqOmSkGgM",
          ),
          _MusicExpansionPanel(
            musicName: "Drop",
            singerName: "The Pharcyde",
            link: "https://www.youtube.com/watch?v=wqVsfGQ_1SU",
          ),
          _MusicExpansionPanel(
            musicName: "Good Luck, Babe",
            singerName: "Chappell Roan",
            link: "https://www.youtube.com/watch?v=1RKqOmSkGgM",
          ),
          _MusicExpansionPanel(
            musicName: "Drop",
            singerName: "The Pharcyde",
            link: "https://www.youtube.com/watch?v=wqVsfGQ_1SU",
          ),
          _MusicExpansionPanel(
            musicName: "Good Luck, Babe",
            singerName: "Chappell Roan",
            link: "https://www.youtube.com/watch?v=1RKqOmSkGgM",
          ),
          _MusicExpansionPanel(
            musicName: "Drop",
            singerName: "The Pharcyde",
            link: "https://www.youtube.com/watch?v=wqVsfGQ_1SU",
          ),
        ],
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  const _HeaderDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 452.w;

  @override
  double get minExtent => 250.w;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _MusicExpansionPanel extends StatefulWidget {
  final String singerName;
  final String musicName;
  final String link;

  const _MusicExpansionPanel({
    required this.singerName,
    required this.musicName,
    required this.link,
  });

  @override
  State<_MusicExpansionPanel> createState() => _MusicExpansionPanelState();
}

class _MusicExpansionPanelState extends State<_MusicExpansionPanel> with SingleTickerProviderStateMixin {
  late AnimationController _expandIconAnimationController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _expandIconAnimationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
      reverseDuration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _expandIconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isExpanded) {
          _expandIconAnimationController.reverse();
        } else {
          _expandIconAnimationController.forward();
        }

        _isExpanded = !_isExpanded;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13.w),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: colorE4E7ED),
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: _isExpanded ? 187.w : 0,
              padding: EdgeInsets.only(top: 10.w),
              child: _isExpanded ? _MusicPlayer(link: widget.link) : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Assets.svg.iconSound.svg(
          width: 24.w,
          height: 24.w,
        ),
        SizedBox(width: 7.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.singerName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  height: 1,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
              SizedBox(height: 4.w),
              Text(
                widget.musicName,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  height: 1,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
            ],
          ),
        ),
        RotationTransition(
          turns: Tween(begin: 0.0, end: 0.5).animate(_expandIconAnimationController),
          child: Assets.svg.iconArrowBottom.svg(
            width: 24.w,
            height: 24.w,
          ),
        ),
      ],
    );
  }
}

class _MusicPlayer extends StatefulWidget {
  final String link;

  const _MusicPlayer({required this.link});

  @override
  State<_MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<_MusicPlayer> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    final initialVideoId = YoutubePlayer.convertUrlToId(widget.link);

    if (initialVideoId == null) return;

    _controller = YoutubePlayerController(
      initialVideoId: initialVideoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );

    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller == null
        ? const Center(
            child: CircularProgressIndicator(color: color233067),
          )
        : YoutubePlayer(controller: _controller!);
  }
}
