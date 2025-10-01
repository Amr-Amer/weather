import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/models/forecast_model.dart';

class CardList extends StatelessWidget {
  final List<ListElement> days;
  final Function(ListElement) onDaySelected;

  const CardList({
    super.key,
    required this.days,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          final day = days[index];
          final date = day.dtTxt;
          final icon = day.weather.isNotEmpty ? day.weather.first.icon : "01d";
          final temp = day.main.temp.toStringAsFixed(0);

          return GestureDetector(
            onTap: () => onDaySelected(day),
            child: Container(
              width: 60.w,
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              decoration: BoxDecoration(
                color: AppColors.blueDarkColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("${date.day}/${date.month}", style: AppTextStyles.style16WhiteW500),
                  ),
                ),
                SizedBox(height: 6.h),
                Flexible(
                  child: Image.network(
                    "https://openweathermap.org/img/wn/$icon@2x.png",
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.error, color: Colors.white),
                  ),
                ),
                SizedBox(height: 6.h),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("$temp°", style: AppTextStyles.style16WhiteW500),
                  ),
                ),
              ],
            )

          ),
          );
        },
      ),
    );
  }
}



