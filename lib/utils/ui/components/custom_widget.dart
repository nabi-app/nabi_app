import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: RefreshProgressIndicator(
        color: color233067,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final bool? resizeToAvoidBottomInset;
  final bool unfocusWhenTap;

  const CustomScaffold({
    super.key,
    this.appBar,
    this.body,
    this.resizeToAvoidBottomInset,
    this.unfocusWhenTap = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocusWhenTap ? () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus() : null,
      child: Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: Colors.white,
        body: body,
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String? initialText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final int? maxLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool autoFocus;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final ScrollPhysics? scrollPhysics;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? prefixConstraints;
  final BoxConstraints? suffixConstraints;

  const CustomTextField({
    super.key,
    this.initialText,
    this.controller,
    this.onChanged,
    this.contentPadding,
    this.style,
    this.hintText,
    this.hintStyle,
    this.maxLines,
    this.maxLength,
    this.focusNode,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.scrollPhysics,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixConstraints,
    this.suffixConstraints,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      autofocus: widget.autoFocus,
      style: widget.style ??
          TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            height: 1.56,
            leadingDistribution: TextLeadingDistribution.even,
          ),
      scrollPhysics: widget.scrollPhysics,
      textAlign: widget.textAlign,
      minLines: 1,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        isDense: true,
        counterText: "",
        contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(vertical: 10.w),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            TextStyle(
              color: colorC6C8CF,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              height: 1.56,
              leadingDistribution: TextLeadingDistribution.even,
            ),
        border: InputBorder.none,
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: widget.prefixConstraints,
        suffixIcon: widget.suffixIcon,
        suffixIconConstraints: widget.suffixConstraints,
      ),
      cursorColor: color3373F1,
    );
  }
}

class BottomSheetFrame extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? completeButtonText;
  final VoidCallback? onComplete;
  final double? height;
  final Widget? bottomWidget;

  const BottomSheetFrame({
    super.key,
    required this.child,
    this.title,
    this.completeButtonText,
    this.onComplete,
    this.height,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        minimum: EdgeInsets.only(bottom: 16.w),
        maintainBottomViewPadding: true,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height ?? 514.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  _buildBar(),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildTitle(),
                          child,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              _buildBottomWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBar() {
    return Container(
      width: 40.w,
      height: 4.w,
      margin: EdgeInsets.only(top: 12.w, bottom: 22.w),
      decoration: BoxDecoration(
        color: color999DAC,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  Widget _buildTitle() {
    if (title == null) return const SizedBox.shrink();

    return Text(
      title!,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        height: 1,
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: -0.48,
      ),
    );
  }

  Widget _buildBottomWidget() {
    if (bottomWidget != null) {
      return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: bottomWidget!,
      );
    }

    if (completeButtonText == null) return const SizedBox.shrink();

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 16.w),
        child: CompleteButton(
          text: completeButtonText!,
          onTap: onComplete,
        ),
      ),
    );
  }
}

class CompleteButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final Color? activeBackgroundColor;
  
  const CompleteButton({
    super.key,
    this.onTap,
    this.text = "설정완료",
    this.margin,
    this.height,
    this.activeBackgroundColor,
  });

  bool get active => onTap != null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 48.w,
        decoration: BoxDecoration(
          color: active ? (activeBackgroundColor ?? color233067) : colorC6C8CF,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: margin ?? EdgeInsets.symmetric(horizontal: 30.w),
        child: Text(
          text,
          style: TextStyle(
            color: active ? Colors.white : colorE4E4E4,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            height: 1.25,
            leadingDistribution: TextLeadingDistribution.even,
            letterSpacing: -0.48,
          ),
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const BottomButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (_, isKeyboardVisible) {
        return ColoredBox(
          color: colorE4E7ED,
          child: Container(
            width: double.infinity,
            height: 52.w,
            padding: isKeyboardVisible ? null : EdgeInsets.symmetric(horizontal: 16.w),
            margin: isKeyboardVisible
                ? null
                : EdgeInsets.only(
                    top: 10.w,
                    bottom: 16.w + MediaQuery.of(context).padding.bottom,
                  ),
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: color233067,
                disabledBackgroundColor: colorC6C8CF,
                foregroundColor: Colors.white,
                disabledForegroundColor: colorE4E4E4,
                shape: RoundedRectangleBorder(
                  borderRadius: isKeyboardVisible ? BorderRadius.zero : BorderRadius.circular(100),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class OutlinedBorderActionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color activeColor;
  final Color inactiveColor;
  final EdgeInsetsGeometry? margin;

  const OutlinedBorderActionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.activeColor = color3373F1,
    this.inactiveColor = color999DAC,
    this.margin,
  });

  bool get active => onTap != null;

  Color get color => active ? activeColor : inactiveColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11.w),
        margin: margin ?? EdgeInsets.only(right: 16.w),
        height: 28.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: color,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            height: 1.25,
            letterSpacing: -0.48,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
      ),
    );
  }
}

class OutlinedInfoContainer extends StatelessWidget {
  final VoidCallback? onClearTap;
  final Widget prefixIcon;
  final String content;

  const OutlinedInfoContainer({
    super.key,
    this.onClearTap,
    required this.prefixIcon,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        border: Border.all(color: colorA6A7AC),
      ),
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          prefixIcon,
          SizedBox(width: 4.w),
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
          if (onClearTap != null)
            GestureDetector(
              onTap: onClearTap,
              behavior: HitTestBehavior.translucent,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
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

AppBar leftTitleAppBar(String title) => AppBar(
  centerTitle: false,
  leadingWidth: 68.w,
  titleSpacing: 0,
  title: Text(
    title,
    style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      height: 1,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
);