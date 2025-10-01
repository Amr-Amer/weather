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
import 'package:weather/screens/home/presentation/widgets/select_country_widget.dart';
import 'package:weather/screens/home/presentation/widgets/un_select_city_widget.dart';
import 'package:weather/widgets/loading_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.skyColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                color: AppColors.blueDarkColor,
                onRefresh: () async {
                  final state = context.read<HomeCubit>().state;
                  if (state.selectedCountry == null ||
                      state.selectedCountry!.isEmpty) {
                    return;
                  }
                  context.read<HomeCubit>().fetchCurrentWeather(
                    state.selectedCountry!,
                  );
                },
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const LoadingWidget();
                    }
                    if (state.selectedCountry == null ||
                        state.selectedCountry!.isEmpty) {
                      return const UnSelectCityWidget();
                    }

                    return ListView(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 20.w,
                      ),
                      children: [

                        Container(
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
                                context
                                    .read<HomeCubit>()
                                    .formatDate(state.currentWeather?.dt),
                                style: AppTextStyles.style20WhiteW500.copyWith(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Center(
                          child: Text(
                            "${state.currentWeather!.main?.temp?.toInt() ?? '--'}°",
                            style: AppTextStyles.style50WhiteW700,
                          ),
                        ),
                        SizedBox(height: 5.h),

                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              speed: const Duration(milliseconds: 100),
                              state.selectedCountry ?? AppStrings.selectACity,
                              textAlign: TextAlign.center,
                              textStyle: AppTextStyles.style25BlueDarkW700,
                            ),
                          ],
                          totalRepeatCount: 1,
                        ),

                        SizedBox(height: 15.h),

                        Center(
                          child: Column(
                            children: [
                              if (state.currentWeather != null)
                                Image.network(
                                  "https://openweathermap.org/img/wn/${state.currentWeather!.weather?[0].icon}@2x.png",
                                  width: 120.w,
                                  height: 120.h,
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
                              SizedBox(height: 8.h),
                              Text(
                                state.currentWeather?.weather?[0].description ??
                                    AppStrings.clearSky,
                                style: AppTextStyles.style20WhiteW500,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 35.h),

                        // CardInfo(weather: state.currentWeather),

                        CardInfo(
                          humidity: state.currentWeather?.main?.humidity,
                          windSpeed: state.currentWeather?.wind?.speed,
                          feelsLike: state.currentWeather?.main?.feelsLike,
                          pressure: state.currentWeather?.main?.pressure,
                        ),

                        SizedBox(height: 20.h),

                        Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Builder(
                            builder: (context) {
                              final cubit = context.read<HomeCubit>();
                              return SelectCountryWidget(
                                title: AppStrings.changeCity,
                                initialCountry: cubit.state.selectedCountry,
                                onCountrySelected: (newCountry) {
                                  cubit.selectCountry(newCountry);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
