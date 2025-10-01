import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_text_styles.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;

  const LoadingWidget({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.flickr(
            leftDotColor: AppColors.blueDarkColor,
            rightDotColor: AppColors.purple,
            size: 80.sp,
          ),
          if (message != null) ...[
            SizedBox(height: 16.h),
            Text(
              message!,
              style: AppTextStyles.style16blueDarkW500,
            ),
          ],
        ],
      ),
    );
  }
}
