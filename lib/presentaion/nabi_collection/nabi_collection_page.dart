import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/presentaion/goal/components/goal_write_components.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class NabiCollectionPage extends StatelessWidget {
  const NabiCollectionPage({super.key});

  static const String path = "/nabi-collection";
  static const String name = "NabiCollectionPage";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildNabiCardSlider(),
        _buildInfoBottomSheet(),
      ],
    );
  }

  Widget _buildNabiCardSlider() {
    return LayoutBuilder(
      builder: (_, constraints) {
        final height = constraints.maxHeight;
        final isLargeSize = constraints.maxWidth >= 600;

        return Container(
          width: double.infinity,
          height: height * 0.77,
          padding: EdgeInsets.only(
            top: height * 0.0658,
            bottom: height * 0.138,
          ),
          child: CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (_, index, __) => _buildNabiCard(),
            options: CarouselOptions(
              viewportFraction: isLargeSize ? 0.5 : 0.747,
              aspectRatio: 280 / 344,
              enableInfiniteScroll: false,
              clipBehavior: Clip.none,
              onPageChanged: (_, __) {},
            ),
          ),
        );
      },
    );
  }

  Widget _buildNabiCard() {
    return LayoutBuilder(
      builder: (_, constraints) {
        const designHeight = 344;
        final scale = constraints.maxHeight / designHeight;

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colorFFFBE4,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.14),
                blurRadius: 14,
                spreadRadius: 0,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                "골드간 나비",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20 * scale,
                  height: 1,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
              SizedBox(height: 30 * scale),
              Assets.svg.iconNabi.svg(
                width: 156 * scale,
                height: 87 * scale,
              ),
              SizedBox(height: 30 * scale),
              Text(
                "완료된 목표",
                style: TextStyle(
                  color: color9F9F9F,
                  fontWeight: FontWeight.w500,
                  fontSize: 16 * scale,
                  height: 1.5,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
              SizedBox(height: 10 * scale),
              Text(
                "7월 까지 솔랭 골드 찍기😋",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20 * scale,
                  height: 1.3,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
              const Spacer(),
              Text(
                "2024.07.07",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16 * scale,
                  height: 1.5,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoBottomSheet() {
    return Positioned.fill(
      child: _NabiInfoBottomSheet(),
    );
  }
}

class _NabiInfoBottomSheet extends StatelessWidget {
  const _NabiInfoBottomSheet();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2302,
      minChildSize: 0.2302,
      maxChildSize: 0.9638,
      expand: false,
      snap: true,
      builder: (_, scrollController) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.w),
            topRight: Radius.circular(20.w),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.14),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                bottom: 16.w,
                top: 38.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNabiName(),
                  SizedBox(height: 30.w),
                  _buildInfoTitle("완료한 목표 이름"),
                  _buildContentText("7월 까지 솔랭 골드 찍기😋"),
                  SizedBox(height: 40.w),
                  _buildInfoTitle("목표 설명"),
                  _buildContentText("지긋지긋한 브실 구간에서 벗어나고 싶지 않아? 섬머 스플릿 때 무조건 탈출한다! 가자 골드로!"),
                  SizedBox(height: 40.w),
                  _buildInfoTitle("목표 완료일"),
                  _buildGoalCompletedDate(),
                  SizedBox(height: 40.w),
                  _buildInfoTitle("완료된 하위 할 일"),
                  _buildTodoList()
                ],
              ),
            ),
            _buildBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Container(
            width: 40.w,
            height: 4.w,
            margin: EdgeInsets.only(
              top: 12.w,
              bottom: 22.w,
            ),
            decoration: BoxDecoration(
              color: color999DAC,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNabiName() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "골드간 나비",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
          letterSpacing: -0.48,
        ),
      ),
    );
  }

  Widget _buildInfoTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.w),
      child: Text(
        text,
        style: TextStyle(
          color: color999DAC,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
          letterSpacing: -0.48,
        ),
      ),
    );
  }

  Widget _buildContentText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        height: 1.5625,
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: -0.48,
      ),
    );
  }

  Widget _buildGoalCompletedDate() {
    return OutlinedInfoContainer(
      prefixIcon: Assets.svg.iconCalendar.svg(
        colorFilter: const ColorFilter.mode(
          Colors.black,
          BlendMode.srcIn,
        ),
      ),
      content: "2024년 7월 7일",
    );
  }

  Widget _buildTodoList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      separatorBuilder: (_, __) => SizedBox(height: 6.w),
      itemBuilder: (_, index) => TodoItem(
        content: "게임 시작 하면 mute all 하기",
        complete: true,
      ),
    );
  }
}
