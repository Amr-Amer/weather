import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/screens/home/presentation/manager/home_cubit.dart';
import 'package:weather/screens/home/presentation/manager/home_state.dart';

class DateWidget extends StatelessWidget {
  final HomeState state;
  const DateWidget({super.key,required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 8.h, horizontal: 13.w),
      margin: EdgeInsets.only(bottom: 25.h),
      decoration: BoxDecoration(
        color: AppColors.blueDarkColor.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.whiteColor.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: .15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_today,
            size: 20.sp,
            color: AppColors.whiteColor.withValues(alpha: .8),
          ),
          SizedBox(width: 10.w),
          Text(
            context.read<HomeCubit>().formatDate(state.currentWeather?.dt),
            style: AppTextStyles.style20WhiteW500.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
