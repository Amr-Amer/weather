import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/models/forcast.dart';
import 'package:weather/screens/home/presentation/widgets/card_info.dart';

class SelectedDayDetails extends StatelessWidget {
  final ListElement day;
  final String initialCountry;
  const SelectedDayDetails({super.key, required this.day, required this.initialCountry});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${AppStrings.forecast} ${day.dtTxt.day}/${day.dtTxt.month}", style: AppTextStyles.style20WhiteW500),
          SizedBox(height: 16.h),
          Image.network(
            "https://openweathermap.org/img/wn/${day.weather.first.icon}@2x.png",
            width: 100.w,
            height: 100.h,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error, color: Colors.white),
          ),
          SizedBox(height: 15.h),
          Text("${day.main.temp}°", style: AppTextStyles.style22WhiteW500),
          SizedBox(height: 20.h),
          CardInfo(
            humidity: day.main.humidity,
            windSpeed: day.wind.speed,
            feelsLike: day.main.feelsLike,
            pressure: day.main.pressure,
          ),
        ],
      ),
    );
  }
}
