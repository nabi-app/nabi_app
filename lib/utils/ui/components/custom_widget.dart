import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

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

class CustomDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? button1Text;
  final String? button2Text;
  final VoidCallback? onButton1Tap;
  final VoidCallback? onButton2Tap;

  const CustomDialog({
    super.key,
    required this.title,
    required this.subTitle,
    this.button1Text,
    this.button2Text,
    this.onButton1Tap,
    this.onButton2Tap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      title: Center(child: Text(title)),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
        height: 1.22,
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: -0.48,
      ),
      titlePadding: EdgeInsets.only(top: 20.w, bottom: 10.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            subTitle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.w),
          Row(
            children: [
              if (button1Text != null)
                _buildButton(
                  title: button1Text!,
                  color: colorF1F2F7,
                  textColor: color999DAC,
                  onTap: () {
                    if (onButton1Tap == null) {
                      context.pop();
                      return;
                    }

                    onButton1Tap!();
                  },
                ),
              _buildButton(
                title: button2Text ?? "완료",
                onTap: () {
                  if (onButton2Tap == null) {
                    context.pop();
                    return;
                  }

                  onButton2Tap!();
                },
              ),
            ],
          )
        ],
      ),
      contentTextStyle: TextStyle(
        color: color999DAC,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        height: 1.5,
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: -0.48,
      ),
      contentPadding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildButton({
    required String title,
    Color color = color233067,
    Color textColor = Colors.white,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48.w,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              letterSpacing: -0.48,
            ),
          ),
        ),
      ),
    );
  }
}

void showCustomDialog({
  required String title,
  required String subTitle,
  String? button1Text,
  String? button2Text,
  VoidCallback? onButton1Tap,
  VoidCallback? onButton2Tap,
}) {
  showDialog(
    context: rootContext!,
    builder: (_) => CustomDialog(
      title: title,
      subTitle: subTitle,
      button1Text: button1Text,
      button2Text: button2Text,
      onButton1Tap: onButton1Tap,
      onButton2Tap: onButton2Tap,
    ),
  );
}

class BottomSheetFrame extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? completeButtonText;
  final VoidCallback? onComplete;
  final EdgeInsetsGeometry padding;
  final double maxHeightRatio;
  final Widget? bottomWidget;

  const BottomSheetFrame({
    super.key,
    required this.child,
    this.title,
    this.completeButtonText,
    this.onComplete,
    this.padding = EdgeInsets.zero,
    this.maxHeightRatio = 0.6749,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * maxHeightRatio,
      ),
      child: Container(
        width: double.infinity,
        padding: padding,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          minimum: EdgeInsets.only(bottom: 20.w),
          child: Stack(
            children: [
              Column(
                children: [
                  _buildBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildTitle(),
                          child,
                        ],
                      ),
                    ),
                  ),
                  _buildCompleteButton(),
                ],
              ),
              if (bottomWidget != null)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: bottomWidget!,
                ),
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

  Widget _buildCompleteButton() {
    if (completeButtonText == null) return const SizedBox.shrink();

    return CompleteButton(
      text: completeButtonText!,
      onTap: onComplete,
    );
  }
}

class CompleteButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final EdgeInsetsGeometry? margin;

  const CompleteButton({
    super.key,
    this.onTap,
    this.text = "설정완료",
    this.margin,
  });

  bool get active => onTap != null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 48.w,
        decoration: BoxDecoration(
          color: active ? color233067 : colorC6C8CF,
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

class ToastWidget extends StatelessWidget {
  final String message;

  const ToastWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 12.w,
      ),
      decoration: BoxDecoration(color: color999DAC.withOpacity(0.75), borderRadius: BorderRadius.circular(20)),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }
}

void showToast({required String message}) {
  final fToast = FToast();

  final context = rootContext;

  if (context == null) return;

  fToast.init(context);

  fToast.showToast(
    child: ToastWidget(message: message),
  );
}
