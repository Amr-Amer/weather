import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/core/navigation/app_navigator_routes.dart';
import 'package:weather/core/navigation/app_routes.dart';

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

            _buildMenuItem(AppStrings.forecast, Icons.cloud, () {AppNavigationRoutes.push(AppRoutes.forecast);}),
            _buildMenuItem(AppStrings.favorites, Icons.favorite,() {AppNavigationRoutes.push(AppRoutes.favorites);})
          ],
    );
  }

  _buildMenuItem(String title, IconData icon, Function() onTap) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          title: Center(
            child: Row(
              spacing: 10.w,
              children: [
                Icon(icon,size: 24.sp,color: AppColors.blueDarkColor,),
                Text(
                    title,
                    style: AppTextStyles.style20BlueDarkW700
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
