// import 'package:flutter/material.dart';
// import 'package:country_picker/country_picker.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:weather/core/constants/app_colors.dart';
// import 'package:weather/core/constants/app_text_styles.dart';
//
// class SelectCountryWidget extends StatelessWidget {
//   final String title;
//   final Function(String) onCountrySelected;
//   final String? initialCountry;
//
//   const SelectCountryWidget({
//     super.key,
//     required this.title,
//     required this.onCountrySelected,
//     this.initialCountry,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.blueDarkColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//       ),
//       onPressed: () {
//         showCountryPicker(
//           context: context,
//           showPhoneCode: false,
//           useSafeArea: true,
//           onSelect: (country) {
//             onCountrySelected(country.name);
//           },
//           countryListTheme: CountryListThemeData(
//             backgroundColor: Colors.white,
//             textStyle: AppTextStyles.style16blueDarkW500,
//             bottomSheetHeight: 500.h,
//           ),
//         );
//       },
//       icon: Icon(
//         Icons.location_on,
//         color: AppColors.whiteColor,
//       ),
//       label: Text(
//         title,
//         style: AppTextStyles.style16WhiteW500,
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/widgets/city_picker_widget.dart';
import 'package:weather/models/city_model.dart';

class SelectCountryWidget extends StatelessWidget {
  final String title;
  final Function(CityModel) onCitySelected;
  final CityModel? initialCity;

  const SelectCountryWidget({
    super.key,
    required this.title,
    required this.onCitySelected,
    this.initialCity,
  });

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
        showModalBottomSheet(
          useSafeArea: true,
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 16.h,
              left: 16.w,
              right: 16.w,
            ),
            child: CityPickerWidget(
              initialCity: initialCity,
              onCitySelected: onCitySelected,
            ),
          ),
        );
      },
      icon: Icon(
        Icons.location_on,
        color: AppColors.whiteColor,
      ),
      label: Text(
        title,
        style: AppTextStyles.style16WhiteW500,
      ),
    );
  }
}

