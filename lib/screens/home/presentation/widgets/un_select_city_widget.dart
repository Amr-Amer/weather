import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/screens/home/presentation/manager/home_cubit.dart';
import 'package:weather/screens/home/presentation/widgets/select_country_widget.dart';

class UnSelectCityWidget extends StatelessWidget {
  const UnSelectCityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_city_outlined,
                size: 80.sp,
                color: AppColors.whiteColor.withValues(alpha: 0.7),
              ),
              SizedBox(height: 20.h),
              Text(
               AppStrings.pleaseSelectACityForReviewWeather,
                textAlign: TextAlign.center,
                style: AppTextStyles.style20BlueDarkW700,
              ),
              SizedBox(height: 50.h),
              Builder(
                builder: (context) {
                  final cubit = context.read<HomeCubit>();
                  return SelectCountryWidget(cubit: cubit,title: AppStrings.selectACity,);
                },
              ),
            ],
          ),
        ),
      );
  }
}
