import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/screens/forecast/presentation/manager/forecast_cubit.dart';

class CardList extends StatelessWidget {
  final List<ForecastDay> days;
  final Function(ForecastDay) onDaySelected;

  const CardList({super.key, required this.days, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((day) {
        return GestureDetector(
          onTap: () => onDaySelected(day),
          child: Container(
            width: 60.w,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              children: [
                Text(day.day,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 8.h),
                Image.network(day.iconUrl, width: 40.w, height: 40.h),
                SizedBox(height: 8.h),
                Text("${day.temp}°", style: AppTextStyles.style16WhiteW500),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

