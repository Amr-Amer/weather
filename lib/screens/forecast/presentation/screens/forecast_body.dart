import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/screens/forecast/presentation/manager/forecast_cubit.dart';
import 'package:weather/screens/forecast/presentation/widgets/card_list.dart';
import 'package:weather/screens/forecast/presentation/widgets/selected_day_details.dart';
import 'package:weather/screens/forecast/presentation/widgets/un_select_day_widget.dart';
import 'package:weather/widgets/loading_widget.dart';

class ForecastBody extends StatelessWidget {
  final String country;
  const ForecastBody({super.key, required this.country});

  @override
  Widget build(BuildContext context) {

    context.read<ForecastCubit>().fetchForecast(country);

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
            if (state.isLoading) return const LoadingWidget();
            if (state.forecast == null) {
              return Center(
                  child: Text(AppStrings.noDataAvailable, style: AppTextStyles.style22BlueDarkW700));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        speed: const Duration(milliseconds: 100),
                        country,
                        textAlign: TextAlign.center,
                        textStyle: AppTextStyles.style25BlueDarkW700,
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                ),

                SizedBox(height: 20.h,),

                Flexible(
                  flex: 1,
                  child: CardList(
                    days: state.forecast?.list ?? [],
                    onDaySelected: (day) {
                      context.read<ForecastCubit>().selectDay(day);
                    },
                  )
                ),
                SizedBox(height: 30.h),

                state.selectedDay != null
                    ? SelectedDayDetails(day: state.selectedDay!, initialCountry: country)
                    : const Center(child: UnSelectDayWidget()),
              ],
            );
          },
        ),
      ),
    );
  }
}




