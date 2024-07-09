import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nabi_app/domain/model/todo_item_model.dart';
import 'package:nabi_app/presentaion/goal/components/goal_page_components.dart';
import 'package:nabi_app/presentaion/goal/goal_write_view_model.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/components/custom_scaffold.dart';
import 'package:nabi_app/utils/ui/components/custom_text_field.dart';
import 'package:nabi_app/utils/ui/components/nabi_calendar.dart';
import 'package:nabi_app/utils/ui/components/rouded_border_button.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:provider/provider.dart';

class GoalWriteView extends StatelessWidget {
  const GoalWriteView({super.key});

  static const String path = "/goal-write";
  static const String name = "GoalWriteView";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        toolbarHeight: 70.w,
        actions: [
          _buildSaveButton(),
        ],
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: MediaQuery.of(context).padding.bottom + 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.w),
            _buildTitleTextField(context),
            SizedBox(height: 30.w),
            _buildGoalDescriptionTextField(context),
            SizedBox(height: 20.w),
            _buildGoalPeriodSelectionArea(context),
            SizedBox(height: 20.w),
            _buildNotificationSettingArea(context),
            SizedBox(height: 20.w),
            _buildTodoArea(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Consumer<GoalWriteViewModel>(
      builder: (_, viewModel, __) => Padding(
        padding: EdgeInsets.only(right: 16.w),
        child: RoundedBorderButton(
          text: "저장하기",
          onTap: viewModel.title.isEmpty || viewModel.description.isEmpty ? null : () {},
        ),
      ),
    );
  }

  Widget _buildTitleTextField(BuildContext context) {
    final baseTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 22.sp,
      height: 1.36,
      leadingDistribution: TextLeadingDistribution.even,
    );

    return CustomTextField(
      hintText: "목표 이름을 입력해주세요.",
      hintStyle: baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        color: colorC6C8CF,
      ),
      maxLines: 2,
      style: baseTextStyle,
      onChanged: context.read<GoalWriteViewModel>().onTitleChanged,
    );
  }

  Widget _buildGoalDescriptionTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("목표 설명"),
        CustomTextField(
          hintText: "설명이 없어요. 설명을 입력해 추가해주세요.",
          maxLines: 2,
          onChanged: context.read<GoalWriteViewModel>().onDescriptionChanged,
        ),
      ],
    );
  }

  Widget _buildGoalPeriodSelectionArea(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("목표 기간"),
        GestureDetector(
          onTap: () async {
            final viewModel = context.read<GoalWriteViewModel>();

            final result = await showCalendarBottomSheet(
              context,
              selectedDay: viewModel.goalDay,
            );

            viewModel.onGoalDayChanged(result);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: Selector<GoalWriteViewModel, DateTime?>(
              selector: (_, viewModel) => viewModel.goalDay,
              builder: (_, goalDay, __) => goalDay == null
                  ? Text(
                      "기간을 설정해주세요.",
                      style: TextStyle(
                        color: colorC6C8CF,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        height: 1.56,
                        leadingDistribution: TextLeadingDistribution.even,
                      ),
                    )
                  : _OutlinedInfoContainer(
                      onClearTap: context.read<GoalWriteViewModel>().clearGoalDay,
                      prefixIcon: Assets.svg.iconCalendar.svg(
                        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      ),
                      content: DateFormat("yyyy년 M월 d일").format(goalDay),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationSettingArea(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("알림 설정"),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => NotificationTimeSelectionBottomSheet(),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: Selector<GoalWriteViewModel, DateTime?>(
              selector: (_, viewModel) => viewModel.notificationTime,
              builder: (_, notificationTime, __) => notificationTime == null
                  ? Text(
                      "기간을 설정하고 알림을 추가해보세요.",
                      style: TextStyle(
                        color: colorC6C8CF,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        height: 1.56,
                        leadingDistribution: TextLeadingDistribution.even,
                      ),
                    )
                  : _OutlinedInfoContainer(
                      onClearTap: () {},
                      prefixIcon: Assets.svg.iconClock.svg(
                        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      ),
                      content: "",
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTodoArea(BuildContext context) {
    return Selector<GoalWriteViewModel, List<TodoItemModel>>(
      selector: (_, viewModel) => viewModel.todoList,
      builder: (_, todoList, __) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle("하위 할 일"),
          SizedBox(height: 10.w),
          GoalProgressBarInfo(
            progress: todoList.isEmpty ? 0 : (todoList.where((todo) => todo.complete).length / todoList.length) * 100,
          ),
          SizedBox(height: 10.w),
          _buildTodoList(todoList),
          _buildTodoAddButton(context),
        ],
      ),
    );
  }

  Widget _buildTodoList(List<TodoItemModel> todoList) {
    if (todoList.isEmpty) return const SizedBox.shrink();

    return ListView.separated(
      padding: EdgeInsets.only(bottom: 10.w),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final todo = todoList[index];

        return _TodoItem(
          content: todo.content,
          complete: todo.complete,
          onCheck: () => context.read<GoalWriteViewModel>().checkTodo(index),
          onTap: () => _showTodoTextField(
            context,
            content: todo.content,
          ).then(
            (content) => context.read<GoalWriteViewModel>().updateTodo(
                  index: index,
                  content: content,
                ),
          ),
        );
      },
      separatorBuilder: (_, __) => SizedBox(height: 6.w),
      itemCount: todoList.length,
    );
  }

  Widget _buildTodoAddButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _showTodoTextField(context).then(context.read<GoalWriteViewModel>().addTodoList),
      child: Row(
        children: [
          Container(
            width: 22.w,
            height: 22.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: colorF1F2F7,
              shape: BoxShape.circle,
            ),
            child: Assets.svg.iconAdd.svg(
              width: 10.w,
              height: 10.w,
              colorFilter: const ColorFilter.mode(
                color999DAC,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            "하위 할 일 추가",
            style: TextStyle(
              color: color233067,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              height: 1,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: color999DAC,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        height: 1,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  Future<String?> _showTodoTextField(BuildContext context, {String? content}) async {
    return showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _TodoTextField(content: content),
    );
  }
}

class _OutlinedInfoContainer extends StatelessWidget {
  final VoidCallback onClearTap;
  final Widget prefixIcon;
  final String content;

  const _OutlinedInfoContainer({
    required this.onClearTap,
    required this.prefixIcon,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: colorA6A7AC),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 7.w,
              right: 4.w,
            ),
            child: prefixIcon,
          ),
          Text(
            content,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              height: 1.25,
              leadingDistribution: TextLeadingDistribution.even,
              letterSpacing: -0.48,
            ),
          ),
          GestureDetector(
            onTap: onClearTap,
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 7.w),
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
    );
  }
}

class _TodoItem extends StatelessWidget {
  final String content;
  final bool complete;
  final VoidCallback onCheck;
  final VoidCallback onTap;

  const _TodoItem({
    required this.content,
    required this.complete,
    required this.onCheck,
    required this.onTap,
  });

  TextStyle get _baseTextStyle => TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        height: 1.42,
        leadingDistribution: TextLeadingDistribution.even,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          color: colorF1F2F7,
          borderRadius: BorderRadius.circular(6),
        ),
        child: complete ? _buildCompleteChild() : _buildIncompleteChild(),
      ),
    );
  }

  Widget _buildCompleteChild() {
    return Row(
      children: [
        GestureDetector(
          onTap: onCheck,
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 11.w),
            child: Assets.svg.iconCheck.svg(
              width: 14.w,
              height: 14.w,
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.w),
            child: Text(
              content,
              style: _baseTextStyle.copyWith(
                color: color999DAC,
                decoration: TextDecoration.lineThrough,
                decorationColor: color999DAC,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIncompleteChild() {
    return Row(
      children: [
        GestureDetector(
          onTap: onCheck,
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 11.w),
            child: Assets.svg.iconCircleEmpty.svg(
              width: 14.w,
              height: 14.w,
              colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.w),
            child: Text(
              content,
              style: _baseTextStyle,
            ),
          ),
        )
      ],
    );
  }
}

class _TodoTextField extends StatefulWidget {
  final String? content;

  const _TodoTextField({this.content});

  @override
  State<_TodoTextField> createState() => _TodoTextFieldState();
}

class _TodoTextFieldState extends State<_TodoTextField> {
  String _value = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(14),
                topLeft: Radius.circular(14),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField(),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: colorE4D7ED,
                ),
                _buildButtons(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    final baseTextField = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 15.sp,
      height: 1.46,
      leadingDistribution: TextLeadingDistribution.even,
    );

    return CustomTextField(
      initialText: widget.content,
      autoFocus: true,
      style: baseTextField,
      hintText: "하위 할 일을 적어주세요.",
      hintStyle: baseTextField.copyWith(color: colorC6C8CF),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.w),
      maxLines: 5,
      onChanged: (value) => _value = value,
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20.w,
        top: 11.w,
        bottom: 12.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RoundedBorderButton(
            onTap: () => context.pop(_value),
            text: "저장하기",
          ),
          SizedBox(width: 10.w),
          RoundedBorderButton(
            onTap: context.pop,
            activeColor: Colors.black,
            text: "취소",
          ),
        ],
      ),
    );
  }
}
