import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/screens/home/presentation/manager/home_cubit.dart';
import 'package:weather/screens/home/presentation/manager/home_state.dart';
import 'package:weather/screens/home/presentation/widgets/card_info.dart';
import 'package:weather/screens/home/presentation/widgets/date_widget.dart';
import 'package:weather/screens/home/presentation/widgets/select_country_widget.dart';
import 'package:weather/screens/home/presentation/widgets/un_select_city_widget.dart';
import 'package:weather/widgets/loading_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.skyColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingWidget();
            }
            if (state.selectedCity?.name == null ||
                state.selectedCity!.name.isEmpty) {
              return const UnSelectCityWidget();
            }

            return Column(
              children: [

                Expanded(
                  child: RefreshIndicator(
                    color: AppColors.blueDarkColor,
                    onRefresh: () async {
                      final cubit = context.read<HomeCubit>();
                      if (cubit.state.selectedCity != null &&
                          cubit.state.selectedCity!.name.isNotEmpty) {
                        cubit.fetchCurrentWeather(cubit.state.selectedCity!.name);
                      }
                    },
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.h,
                        horizontal: 12.w,
                      ),
                      children: [

                        DateWidget(state: state),
                        SizedBox(height: 20.h),

                        Center(
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                speed: const Duration(milliseconds: 100),
                                state.selectedCity?.name ??
                                    AppStrings.selectACity,
                                textAlign: TextAlign.center,
                                textStyle: AppTextStyles.style40BlueDarkW700,
                              ),
                            ],
                            totalRepeatCount: 1,
                          ),
                        ),

                        Center(
                          child: Text(
                            state.currentWeather?.main?.temp != null
                                ? "${state.currentWeather!.main!.temp!.toInt()}°"
                                : "--°",
                            style: AppTextStyles.style70WhiteW700,
                          ),
                        ),

                        SizedBox(height: 20.h),

                        Center(
                          child: Column(
                            children: [
                              if (state.currentWeather != null)
                                Image.network(
                                  "https://openweathermap.org/img/wn/${state.currentWeather!.weather?[0].icon}@2x.png",
                                  width: 100.w,
                                  height: 100.h,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.wb_sunny,
                                      size: 80.sp,
                                      color: AppColors.whiteColor,
                                    );
                                  },
                                )
                              else
                                Icon(
                                  Icons.wb_sunny,
                                  size: 80.sp,
                                  color: AppColors.whiteColor,
                                ),
                              SizedBox(height: 10.h),
                              Text(
                                state.currentWeather?.weather?[0].description ??
                                    AppStrings.clearSky,
                                style: AppTextStyles.style20WhiteW500,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 25.h),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  child: CardInfo(
                    humidity: state.currentWeather?.main?.humidity,
                    windSpeed: state.currentWeather?.wind?.speed,
                    feelsLike: state.currentWeather?.main?.feelsLike,
                    pressure: state.currentWeather?.main?.pressure,
                  ),
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Builder(
                    builder: (context) {
                      final cubit = context.read<HomeCubit>();
                      return SizedBox(
                        width: double.infinity,
                        child: SelectCountryWidget(
                          title: cubit.state.selectedCity?.name ??
                              AppStrings.selectACity,
                          initialCity: cubit.state.selectedCity,
                          onCitySelected: (city) {
                            cubit.selectCity(city);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
