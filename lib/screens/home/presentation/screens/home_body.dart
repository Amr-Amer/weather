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
                        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w,
                        ),
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 80.h,vertical: 20.h),
                            padding: EdgeInsets.all(5.r),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.blueDarkColor,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.blackColor.withValues(alpha: 0.2),
                                  blurRadius: 10.r,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Text(
                              context.read<HomeCubit>().formatDate(state.currentWeather?.dt),
                              style: AppTextStyles.style20WhiteW500,
                            ),
                          ),

                          Center(
                            child: Text(
                              "${state.currentWeather!.main?.temp?.toInt() ?? '--'}°",
                              style: AppTextStyles.style50WhiteW700,
                            ),
                          ),
                          Center(
                            child: Text(
                              state.selectedCountry ?? AppStrings.selectACity,
                              style: AppTextStyles.style22WhiteW500,
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                if (state.currentWeather != null)
                                  Image.network(
                                    "https://openweathermap.org/img/wn/${state.currentWeather!.weather?[0].icon}@2x.png",
                                    width: 130.w,
                                    height: 130.h,
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
                                  state.currentWeather?.weather?[0]
                                      .description ?? AppStrings.clearSky,
                                  style: AppTextStyles.style20WhiteW500,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40.h),
                          CardInfo(weather: state.currentWeather),
                          Padding(
                            padding: EdgeInsets.all(20.r),
                            child: Builder(
                              builder: (context) {
                                final cubit = context.read<HomeCubit>();
                                return SelectCountryWidget(
                                  cubit: cubit,
                                  title: AppStrings.changeCity,
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
          )
      ),
    );
  }
}
