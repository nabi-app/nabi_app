import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/presentaion/home/components/home_page_components.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:nabi_app/user/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String name = "home";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 30.w, 16.w, 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTitle(),
                _buildProfile(context),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.w),
                  _buildCategoryGrid(),
                  SizedBox(height: 30.w),
                  _buildGoalListTitle(),
                  SizedBox(height: 20.w),
                  _buildGoalList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "나의 목표",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 32.sp,
        height: 1.125,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    final imageUrl = context.read<AuthProvider>().userInfo!.profileImage;

    return Container(
      height: 44.w,
      width: 44.w,
      decoration: BoxDecoration(
        color: Colors.pink,
        shape: BoxShape.circle,
        image: imageUrl?.isEmpty ?? true
            ? null
            : DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.w,
        crossAxisSpacing: 16.w,
        childAspectRatio: 1.635,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
      children: [
        CategoryCard(
          title: "목표 달성률",
          progress: "0%",
          color: color233067,
        ),
        CategoryCard(
          title: "완료된 놈들",
          progress: "0",
          color: color1F1F1F,
        ),
        CategoryCard(
          title: "투데이",
          progress: "0",
          color: color37C520,
        ),
        CategoryCard(
          title: "기간 지난 놈들",
          progress: "0",
          color: colorFA3E25,
        ),
      ],
    );
  }

  Widget _buildGoalListTitle() {
    final baseTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 20.sp,
      height: 1,
      letterSpacing: -0.48.sp,
      leadingDistribution: TextLeadingDistribution.even,
    );

    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Row(
        children: [
          Text(
            "내 목표 목록",
            style: baseTextStyle,
          ),
          SizedBox(width: 10.w),
          Text(
            "0",
            style: baseTextStyle.copyWith(
              color: color999DAC,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalList() {
    final goalList = [1, 1, 1, 1, 1, 1, 1];

    if (goalList.isEmpty) return _buildGoalEmptyMessage();

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.w),
      itemCount: goalList.length,
      separatorBuilder: (_, __) => SizedBox(height: 14.w),
      itemBuilder: (_, index) {
        final goal = goalList[index];

        return GoalCard(
          title: "전화해서 알아보기",
          progress: 70,
        );
      },
    );
  }

  Widget _buildGoalEmptyMessage() {
    final textStyle = TextStyle(
      color: color999DAC,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      height: 1.25,
      leadingDistribution: TextLeadingDistribution.even,
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 55.w),
      child: Column(
        children: [
          Text(
            "진행 중인 목표가 없어요.",
            style: textStyle,
          ),
          SizedBox(height: 10.w),
          Text(
            "+ 버튼으로 목표달성을 시작해보세요!",
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
