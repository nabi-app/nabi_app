import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/presentaion/music_recommend/music_recommend_detail_view.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';

class MusicRecommendPage extends StatelessWidget {
  const MusicRecommendPage({super.key});

  static const String path = "/music-recommend";
  static const String name = "MusicRecommendPage";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFilterButtons(),
        _buildPlayListCardList(),
      ],
    );
  }

  Widget _buildFilterButtons() {
    return Container(
      height: 32.w,
      margin: EdgeInsets.symmetric(vertical: 6.w),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          FilterButton(
            text: "전체",
            selected: true,
            onTap: () {},
          ),
          SizedBox(width: 8.w),
          FilterButton(
            text: "에너지",
            selected: true,
            onTap: () {},
          ),
          SizedBox(width: 8.w),
          FilterButton(
            text: "동기부여",
            selected: false,
            onTap: () {},
          ),
          SizedBox(width: 8.w),
          FilterButton(
            text: "슬픔",
            selected: false,
            onTap: () {},
          ),
          SizedBox(width: 8.w),
          FilterButton(
            text: "화려함",
            selected: false,
            onTap: () {},
          ),
          SizedBox(width: 8.w),
          FilterButton(
            text: "등등",
            selected: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildPlayListCardList() {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 20.w),
        itemCount: 4,
        separatorBuilder: (_, __) => SizedBox(height: 20.w),
        itemBuilder: (context, index) => _buildPlayListCard(context),
      ),
    );
  }

  Widget _buildPlayListCard(BuildContext context) {
    return AspectRatio(
      aspectRatio: 343 / 410,
      child: Stack(
        children: [
          _buildPlayListCardBackground(),
          _buildShowMoreButton(context),
        ],
      ),
    );
  }

  Widget _buildPlayListCardBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
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
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            _buildTitle(),
            Wrap(
              spacing: 10.w,
              runSpacing: 10.w,
              alignment: WrapAlignment.center,
              children: [
                _buildOutlinedFilter(),
                _buildOutlinedFilter(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 90.w, bottom: 10.w),
      child: Text(
        "몸과 마음이 지친 그대에게!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          height: 1.5,
          leadingDistribution: TextLeadingDistribution.even,
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

  Widget _buildShowMoreButton(BuildContext context) {
    return Positioned(
      right: 16.w,
      bottom: 30.w,
      width: 72.w,
      height: 34.w,
      child: GestureDetector(
        onTap: () => context.pushNamed(MusicRecommendDetailView.name),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(26.w)),
          alignment: Alignment.center,
          child: Text(
            "더 보기",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              height: 1,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
        ),
      ),
    );
  }
}
