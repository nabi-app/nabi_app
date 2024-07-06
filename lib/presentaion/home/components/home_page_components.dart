import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String progress;
  final Color color;

  const CategoryCard({
    super.key,
    required this.title,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitle(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIcon(),
              _buildProgress(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
        height: 1,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  Widget _buildIcon() {
    return Text("아이콘");
  }

  Widget _buildProgress() {
    return Text(
      progress,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 30.sp,
        height: 1.193,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  final String title;
  final double progress;

  const GoalCard({
    super.key,
    required this.title,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildButton(),
              SizedBox(width: 10.w),
              _buildTitle(),
              _buildClock(),
              SizedBox(width: 8.w),
              _buildCalendar(),
            ],
          ),
          _buildProgressInfo(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Assets.svg.iconCircleEmpty.svg(
      width: 20.w,
      height: 20.w,
      colorFilter: const ColorFilter.mode(
        Colors.black,
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16.w,
          height: 1.25,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }

  Widget _buildClock() {
    return Assets.svg.iconClock.svg(
      width: 20.w,
      height: 20.w,
    );
  }

  Widget _buildCalendar() {
    return Assets.svg.iconCalendar.svg(
      width: 20.w,
      height: 20.w,
    );
  }

  Widget _buildProgressInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 14.w),
      child: Row(
        children: [
          Expanded(
            child: _buildProgressBar(),
          ),
          SizedBox(width: 10.w),
          Text(
            "${progress.round()}% 완료",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              height: 1.57,
              letterSpacing: -0.48.sp
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      width: double.infinity,
      height: 8.w,
      decoration: BoxDecoration(
        color: colorE4D7ED,
        borderRadius: BorderRadius.circular(100),
      ),
      child: FractionallySizedBox(
        widthFactor: progress / 100,
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: color3373F1,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
