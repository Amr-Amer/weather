import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/models/weather_model.dart';

class CardInfo extends StatelessWidget {
  final WeatherModel? weather;

  const CardInfo({super.key, this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blueDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _infoTile(
            "Humidity",
            "${weather?.main?.humidity ?? '--'}%",
            "💧",
          ),
          _infoTile(
            "Wind",
            "${weather?.wind?.speed?.toInt() ?? '--'} km/h",
            "🌬️",
          ),
          _infoTile(
            "Feels Like",
            "${weather?.main?.feelsLike?.toInt() ?? '--'}°",
            "🌡️",
          ),
          _infoTile(
            "Pressure",
            "${weather?.main?.pressure ?? '--'}hPa",
            "⚖️",
          ),
        ],
      ),
    );
  }

  Widget _infoTile(String title, String value, String icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.r,horizontal: 5.r),
      child: Column(
        children: [
          Text(
            icon,
            style: AppTextStyles.style22WhiteW500,
          ),
          SizedBox(height: 7.h),
          Text(
            value,
            style: AppTextStyles.style18WhiteW600,
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: AppTextStyles.style14WhiteW500,
          ),
        ],
      ),
    );
  }
}
