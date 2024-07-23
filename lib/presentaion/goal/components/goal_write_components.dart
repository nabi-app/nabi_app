import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/enum/notification_time_type.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

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
    return BottomSheetFrame(
      title: "알림 시간 설정",
      completeButtonText: "설정완료",
      onComplete: (_timeType == null || _hour == null || _minute == null) ? null : () => context.pop(_calculateTime()),
      child: Column(
        children: [
          SizedBox(height: 30.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                _buildTimeTypeButton(NotificationTimeType.morning),
                SizedBox(width: 10.w),
                _buildTimeTypeButton(NotificationTimeType.afternoon),
              ],
            ),
          ),
          SizedBox(height: 30.w),
          _buildTimeTitle("몇시로 설정할까요?"),
          SizedBox(height: 14.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Wrap(
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
          ),
          SizedBox(height: 30.w),
          _buildTimeTitle("몇분으로 할까요?"),
          SizedBox(height: 14.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Wrap(
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
          ),
        ],
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
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