import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/screens/cities/presentation/manager/cities_cubit.dart';

class CitiesBody extends StatelessWidget {
  const CitiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CitiesCubit, List<String>>(
        builder: (context, cities) {
          if (cities.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_off, size: 80.sp, color: AppColors.whiteColor.withValues(alpha: 0.6)),
                SizedBox(height: 16.h),
                Text(
                  AppStrings.noFavoriteCitiesYet,
                  style: AppTextStyles.style20WhiteW500.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            );
          }
          return ListView.separated(
            padding: EdgeInsets.all(16.r),
            itemCount: cities.length,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              final city = cities[index];
              return Card(
                color: AppColors.blueDarkColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 8.h, horizontal: 12.h),
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primaryColor.withValues(alpha: 0.2),
                    child: const Icon(Icons.location_city,
                        color: AppColors.primaryColor),
                  ),
                  title: Text(
                    city,
                    style: AppTextStyles.style20WhiteW500,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: AppColors.red),
                    onPressed: () {
                      context.read<CitiesCubit>().removeCity(city);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
