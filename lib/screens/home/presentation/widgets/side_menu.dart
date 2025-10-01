import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/core/navigation/app_navigator_routes.dart';
import 'package:weather/core/navigation/app_routes.dart';
import 'package:weather/screens/home/presentation/manager/home_cubit.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.skyColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              AppStrings.appName,
              style: AppTextStyles.style20BlueDarkW700,
            ),
          ),
        ),

        _buildMenuItem(
          context,
          AppStrings.forecast,
          Icons.cloud,
              () {
            AppNavigationRoutes.pop();
            final homeCubit = context.read<HomeCubit>();
            final selectedCity = homeCubit.state.selectedCity?.name ?? "Cairo";
            AppNavigationRoutes.push(
              AppRoutes.forecast,
              arguments: selectedCity,
            );
          },
        ),

        _buildMenuItem(
          context,
          AppStrings.favorites,
          Icons.favorite,
              () {
            AppNavigationRoutes.pop();
            AppNavigationRoutes.push(AppRoutes.favorites);
          },
        ),
      ],
    );
  }

  Widget _buildMenuItem(
      BuildContext context,
      String title,
      IconData icon,
      Function() onTap,
      ) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, size: 24.sp, color: AppColors.blueDarkColor),
      title: Text(title, style: AppTextStyles.style20BlueDarkW700),
    );
  }
}

