import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/screens/forecast/presentation/manager/forecast_cubit.dart';
import 'package:weather/screens/forecast/presentation/widgets/card_list.dart';
import 'package:weather/screens/forecast/presentation/widgets/un_select_day_widget.dart';
import 'package:weather/screens/home/presentation/manager/home_cubit.dart';
import 'package:weather/screens/home/presentation/widgets/card_info.dart';
import 'package:weather/screens/home/presentation/widgets/select_country_widget.dart';
import 'package:weather/widgets/loading_widget.dart';

class ForecastBody extends StatelessWidget {
  const ForecastBody({super.key});

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
      padding: EdgeInsets.all(16.r),
      child: SafeArea(
        child: BlocBuilder<ForecastCubit, ForecastState>(
          builder: (context, state) {
            if (state is ForecastLoading) {
              return const LoadingWidget();
            }
            if (state is ForecastLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ✅ قائمة الأيام
                  CardList(
                    days: state.days,
                    onDaySelected: (day) {
                      context.read<ForecastCubit>().selectDay(day);
                    },
                  ),

                  SizedBox(height: 24.h),

                  // ✅ لو اليوم مختار
                  if (state.selectedDay != null) ...[
                    Text(
                      "${AppStrings.forecast} ${state.selectedDay!.day}",
                      style: AppTextStyles.style20WhiteW500,
                    ),
                    SizedBox(height: 16.h),
                    Image.network(
                      state.selectedDay!.iconUrl,
                      width: 100.w,
                      height: 100.h,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "${state.selectedDay!.temp}°",
                      style: AppTextStyles.style22WhiteW500,
                    ),

                    SizedBox(height: 24.h),


                    CardInfo(),

                    SizedBox(height: 24.h),

                    //TODO: Change City
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                  ]
                  // ✅ لو مفيش يوم مختار
                  else ...[
                    const Expanded(
                      child: Center(
                        child: UnSelectDayWidget(),
                      ),
                    ),
                  ],
                ],
              );
            }

            return const Center(
              child: Text("No data", style: TextStyle(color: Colors.white)),
            );
          },
        ),
      ),
    );
  }
}

