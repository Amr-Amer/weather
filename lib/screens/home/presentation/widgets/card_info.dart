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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _infoTile("Humidity", "${humidity ?? '--'}%", "💧"),
          _infoTile("Wind", "${windSpeed?.toInt() ?? '--'} km/h", "🌬️"),
          _infoTile("Feels Like", "${feelsLike?.toInt() ?? '--'}°", "🌡️"),
          _infoTile("Pressure", "${pressure ?? '--'} hPa", "⚖️"),
        ],
      ),
    );
  }

  Widget _infoTile(String title, String value, String icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.r, horizontal: 5.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: AppTextStyles.style22WhiteW500),
          Text(value, style: AppTextStyles.style18WhiteW600),
          Text(title, style: AppTextStyles.style14WhiteW500),
        ],
      ),
    );
  }
}

