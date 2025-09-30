import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_text_styles.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintTxt;
  final void Function(String)? onChange;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.hintTxt,
    this.onChange,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      onChanged: widget.onChange,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        hintText: widget.hintTxt,
        hintStyle: AppTextStyles.style16blueDarkW500.copyWith(
          color: AppColors.dimGray,
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 22.sp,
          color: _isFocused ? AppColors.primaryColor : AppColors.blueDarkColor,
        ),
        filled: true,
        fillColor: AppColors.skyColors.last,
        border: _normalBorder(),
        enabledBorder: _normalBorder(),
        focusedBorder: _focusedBorder(),
      ),
    );
  }

  OutlineInputBorder _normalBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide.none,
    );
  }

  OutlineInputBorder _focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(
        color: AppColors.primaryColor,
        width: 1.5,
      ),
    );
  }
}
