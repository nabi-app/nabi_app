import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/enum/notification_time_type.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/complete_button.dart';
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
  final VoidCallback onTap;
  final VoidCallback onCheck;

  const GoalCard({
    super.key,
    required this.title,
    required this.progress,
    required this.onTap,
    required this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            ...[
              SizedBox(height: 14.w),
              GoalProgressBarInfo(progress: progress),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: onCheck,
      child: Assets.svg.iconCircleEmpty.svg(
        width: 20.w,
        height: 20.w,
        colorFilter: const ColorFilter.mode(
          Colors.black,
          BlendMode.srcIn,
        ),
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
}

class GoalProgressBarInfo extends StatelessWidget {
  final double progress;

  const GoalProgressBarInfo({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildProgressBar(),
        ),
        SizedBox(width: 10.w),
        _buildProgressText(),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Container(
      width: double.infinity,
      height: 8.w,
      decoration: BoxDecoration(
        color: colorE4E7ED,
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

  Widget _buildProgressText() {
    return Text(
      "${progress.round()}% 완료",
      style: TextStyle(
        color: progress == 0 ? color999DAC : Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        height: 1.57,
        letterSpacing: -0.48.sp,
      ),
    );
  }
}

typedef NotificationTime = ({NotificationTimeType type, int hour, int minute});

class NotificationTimeSelectionBottomSheet extends StatefulWidget {
  final NotificationTime? selectedTime;

  const NotificationTimeSelectionBottomSheet({
    super.key,
    this.selectedTime,
  });

  @override
  State<NotificationTimeSelectionBottomSheet> createState() => _NotificationTimeSelectionBottomSheetState();
}

class _NotificationTimeSelectionBottomSheetState extends State<NotificationTimeSelectionBottomSheet> {
  final List<int> hours = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  final List<int> minutes = const [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55];

  NotificationTimeType? _timeType;
  int? _hour;
  int? _minute;

  @override
  void initState() {
    super.initState();
    _timeType = widget.selectedTime?.type;
    _hour = widget.selectedTime?.hour;
    _minute = widget.selectedTime?.minute;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 30.w,
          right: 30.w,
          bottom: MediaQuery.of(context).padding.bottom + 20.w,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildBar(),
            _buildTitle(),
            SizedBox(height: 30.w),
            Row(
              children: [
                _buildTimeTypeButton(NotificationTimeType.morning),
                SizedBox(width: 10.w),
                _buildTimeTypeButton(NotificationTimeType.afternoon),
              ],
            ),
            SizedBox(height: 30.w),
            _buildTimeTitle("몇시로 설정할까요?"),
            SizedBox(height: 14.w),
            Wrap(
              spacing: 10.w,
              runSpacing: 14.w,
              children: hours
                  .map(
                    (hour) => _buildSmallSelectionButton(
                      text: hour.toString(),
                      selected: _hour == hour,
                      onTap: () => setState(() => _hour = hour),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 30.w),
            _buildTimeTitle("몇분으로 할까요?"),
            SizedBox(height: 14.w),
            Wrap(
              spacing: 10.w,
              runSpacing: 14.w,
              children: minutes
                  .map(
                    (minute) => _buildSmallSelectionButton(
                      text: minute == 0 ? minute.toString().padLeft(2, "0") : minute.toString(),
                      selected: _minute == minute,
                      onTap: () => setState(() => _minute = minute),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 30.w),
            CompleteButton(
              margin: EdgeInsets.zero,
              onTap: (_timeType == null || _hour == null || _minute == null) ? null : () => context.pop(_calculateTime()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar() {
    return Container(
      height: 4.w,
      width: 40.w,
      margin: EdgeInsets.only(top: 12.w, bottom: 22.w),
      decoration: BoxDecoration(
        color: color999DAC,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "알림 시간 설정",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        height: 1,
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: -0.48.sp,
      ),
    );
  }

  Widget _buildTimeTypeButton(NotificationTimeType type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _timeType = type),
        child: Container(
          height: 48.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: type == _timeType ? color233067 : colorF1F2F7,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            type.name,
            style: TextStyle(
              color: type == _timeType ? Colors.white : color999DAC,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              height: 1.25,
              leadingDistribution: TextLeadingDistribution.even,
              letterSpacing: -0.48,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
          letterSpacing: -0.48,
        ),
      ),
    );
  }

  Widget _buildSmallSelectionButton({
    required String text,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44.w,
        height: 38.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? color233067 : colorF1F2F7,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : color999DAC,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            height: 1,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
      ),
    );
  }

  NotificationTime _calculateTime() => (type: _timeType!, hour: _hour!, minute: _minute!);
}
