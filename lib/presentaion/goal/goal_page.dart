import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/presentaion/goal/components/goal_page_components.dart';
import 'package:nabi_app/presentaion/goal/goal_write_view.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class GoalPage extends StatelessWidget {
  const GoalPage({super.key});

  static const String path = "/goal";
  static const String name = "GoalPage";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
      itemBuilder: (context, index) {
        final goal = goalList[index];

        return GoalCard(
          title: "전화해서 알아보기",
          progress: 70,
          onTap: () => context.pushNamed(GoalWriteView.name),
          onCheck: () {
            showCustomDialog(
              title: "완료할까요?",
              subTitle: "하위 할 일이 완료되지 않았는데 강제로 완료할까요?",
              button1Text: "아니요",
              button2Text: "완료",
            );
          },
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
