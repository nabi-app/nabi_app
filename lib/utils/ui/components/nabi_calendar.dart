import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/custom_widget.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:table_calendar/table_calendar.dart';

class NabiCalendar extends StatefulWidget {
  final DateTime? selectedDay;
  final DateTime? firstDay;
  final DateTime? lastDay;
  final OnDaySelected onDaySelected;

  const NabiCalendar({
    super.key,
    required this.selectedDay,
    required this.firstDay,
    required this.lastDay,
    required this.onDaySelected,
  });

  @override
  State<NabiCalendar> createState() => _NabiCalendarState();
}

class _NabiCalendarState extends State<NabiCalendar> {
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.selectedDay ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: widget.firstDay ?? DateTime(1900),
      lastDay: widget.lastDay ?? DateTime(2100),
      selectedDayPredicate: (date) => widget.selectedDay == null
          ? false
          : date.year == widget.selectedDay!.year &&
              date.month == widget.selectedDay!.month &&
              date.day == widget.selectedDay!.day,
      onDaySelected: widget.onDaySelected,
      locale: "ko_KR",
      availableGestures: AvailableGestures.horizontalSwipe,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: _headerTitleBuilder,
        dowBuilder: _dowBuilder,
        outsideBuilder: (_, __, ___) => const SizedBox.shrink(),
        defaultBuilder: _defaultBuilder,
        selectedBuilder: _selectedBuilder,
        todayBuilder: _defaultBuilder,
        disabledBuilder: _defaultBuilder,
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        headerPadding: EdgeInsets.only(bottom: 30.w),
        leftChevronVisible: false,
        rightChevronVisible: false,
      ),
      daysOfWeekHeight: 42.w,
      rowHeight: 52.w,
    );
  }

  Widget _headerTitleBuilder(BuildContext context, DateTime dateTime) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat("yyyy년 M월").format(dateTime),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              height: 1,
              leadingDistribution: TextLeadingDistribution.even,
              letterSpacing: -0.48,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildArrowButton(
                icon: Assets.svg.iconArrowLeft.svg(
                  colorFilter: const ColorFilter.mode(
                    color999DAC,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () => setState(() => _focusedDay = _focusedDay.copyWith(month: _focusedDay.month - 1)),
              ),
              SizedBox(width: 30.w),
              _buildArrowButton(
                icon: Assets.svg.iconArrowRight.svg(
                  colorFilter: const ColorFilter.mode(
                    color999DAC,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () => setState(() => _focusedDay = _focusedDay.copyWith(month: _focusedDay.month + 1)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildArrowButton({
    required Widget icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24.w,
        height: 24.w,
        decoration: const BoxDecoration(
          color: colorF1F2F7,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: icon,
      ),
    );
  }

  Widget _dowBuilder(BuildContext context, DateTime dateTime) {
    return Container(
      decoration: BoxDecoration(
        color: colorF1F2F7,
        borderRadius: BorderRadius.circular(100),
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 5.w,
        right: 5.w,
        bottom: 10.w,
      ),
      child: Text(
        DateFormat('E', 'ko_KR').format(dateTime),
        style: TextStyle(
          color: color999DAC,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }

  Widget _defaultBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
    return _buildDayFrame(
      day.day.toString(),
      fontColor: day.weekday == 7 ? Colors.red : Colors.black,
    );
  }

  Widget _selectedBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
    return _buildDayFrame(
      day.day.toString(),
      color: color233067,
      fontColor: Colors.white,
    );
  }

  Widget _buildDayFrame(
    String day, {
    Color color = colorF1F2F7,
    Color fontColor = Colors.black,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.w),
      child: Text(
        day,
        style: TextStyle(
          color: fontColor,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }
}

class NabiCalendarBottomSheet extends StatefulWidget {
  final String? title;
  final DateTime? selectedDay;
  final DateTime? firstDay;
  final DateTime? lastDay;

  const NabiCalendarBottomSheet({
    super.key,
    this.title,
    required this.selectedDay,
    required this.firstDay,
    required this.lastDay,
  });

  @override
  State<NabiCalendarBottomSheet> createState() => _NabiCalendarBottomSheetState();
}

class _NabiCalendarBottomSheetState extends State<NabiCalendarBottomSheet> {
  DateTime? _selectedDay;

  bool get _isDaySelected => _selectedDay != null;

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.selectedDay;
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetFrame(
      title: widget.title ?? "날짜 설정",
      completeButtonText: "설정완료",
      onComplete: !_isDaySelected ? null : () => context.pop(_selectedDay),
      child: Column(
        children: [
          SizedBox(height: 30.w),
          _buildCalendar(),
          SizedBox(height: 20.w),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: NabiCalendar(
        selectedDay: _selectedDay,
        firstDay: widget.firstDay,
        lastDay: widget.lastDay,
        onDaySelected: (selectedDay, focusedDay) {
          _selectedDay = selectedDay;
          setState(() {});
        },
      ),
    );
  }
}

Future<DateTime?> showCalendarBottomSheet(
  BuildContext context, {
  String? title,
  required DateTime? selectedDay,
  DateTime? firstDay,
  DateTime? lastDay,
}) {
  return showModalBottomSheet<DateTime>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (_) => NabiCalendarBottomSheet(
      title: title,
      selectedDay: selectedDay,
      firstDay: firstDay,
      lastDay: lastDay,
    ),
  );
}
