import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/screens/home/presentation/manager/home_cubit.dart';

class SelectCountryWidget extends StatelessWidget {
  final HomeCubit cubit;
  final String title;
  const SelectCountryWidget({super.key, required this.cubit, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueDarkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      onPressed: () {
        return showCountryPicker(
          context: context,
          showPhoneCode: false,
          useSafeArea: true,
          onSelect: (country) {
            cubit.selectCountry(country.name);
          },
        );
      },
      icon: Icon(Icons.location_on,color: AppColors.whiteColor,),
      label: Text(title,style: AppTextStyles.style16WhiteW500,),
    );
  }
}
