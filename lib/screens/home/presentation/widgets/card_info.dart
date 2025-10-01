import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_text_styles.dart';

class CardInfo extends StatelessWidget {
  final int? humidity;
  final double? windSpeed;
  final double? feelsLike;
  final int? pressure;

  const CardInfo({
    super.key,
    this.humidity,
    this.windSpeed,
    this.feelsLike,
    this.pressure,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blueDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _infoTile("Humidity", "${humidity ?? '--'}%", "💧"),
            _divider(),
            _infoTile("Wind", "${windSpeed?.toInt() ?? '--'} km/h", "🌬️"),
            _divider(),
            _infoTile("Feels Like", "${feelsLike?.toInt() ?? '--'}°", "🌡️"),
            _divider(),
            _infoTile("Pressure", "${pressure ?? '--'} hPa", "⚖️"),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 50.h,
      width: 1,
      color: AppColors.dimGray.withValues(alpha: .6),
    );
  }

  Widget _infoTile(String title, String value, String icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(icon, style: AppTextStyles.style22WhiteW500),
        SizedBox(height: 6.h),
        Text(value, style: AppTextStyles.style18WhiteW600),
        SizedBox(height: 4.h),
        Text(title, style: AppTextStyles.style14WhiteW500),
      ],
    );
  }
}
