import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class CustomTextField extends StatefulWidget {
  final String? initialText;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final int? maxLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool autoFocus;

  const CustomTextField({
    super.key,
    this.initialText,
    this.onChanged,
    this.contentPadding,
    this.style,
    this.hintText,
    this.hintStyle,
    this.maxLines,
    this.maxLength,
    this.focusNode,
    this.autoFocus = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
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
      style: widget.style ?? TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        height: 1.56,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      minLines: 1,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        isDense: true,
        counterText: "",
        contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(vertical: 10.w),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? TextStyle(
          color: colorC6C8CF,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          height: 1.56,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        border: InputBorder.none,
      ),
      cursorColor: color3373F1,
    );
  }
}
