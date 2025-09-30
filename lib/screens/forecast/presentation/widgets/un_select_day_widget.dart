import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/constants/app_text_styles.dart';

class UnSelectDayWidget extends StatelessWidget {
  const UnSelectDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300.h,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 20.h),
        color: Colors.transparent,
        shadowColor: AppColors.blueDarkColor.withValues(alpha: 0.5),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_city_outlined,
            size: 80.sp,
            color: AppColors.whiteColor.withValues(alpha: 0.7),
            ),
            SizedBox(height: 20.h),
            Text(AppStrings.pleaseSelectADayForReviewWeather,
            style: AppTextStyles.style20BlueDarkW700,
            textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
