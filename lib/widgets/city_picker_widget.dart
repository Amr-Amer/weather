import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/models/city_model.dart';

class CityPickerWidget extends StatefulWidget {
  final CityModel? initialCity;
  final Function(CityModel) onCitySelected;

  const CityPickerWidget({
    super.key,
    required this.onCitySelected,
    this.initialCity,
  });

  @override
  State<CityPickerWidget> createState() => _CityPickerWidgetState();
}

class _CityPickerWidgetState extends State<CityPickerWidget> {
  List<CityModel> filteredCities = Cities.allCities;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      final query = searchController.text.toLowerCase();
      setState(() {
        filteredCities = Cities.allCities
            .where((city) =>
        city.name.toLowerCase().contains(query) ||
            city.country.toLowerCase().contains(query))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  String getFlagEmoji(String countryCode) {
    return countryCode.toUpperCase().codeUnits
        .map((e) => String.fromCharCode(e + 127397))
        .join();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: AppStrings.search,
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 500.h,
          child: ListView.builder(
            itemCount: filteredCities.length,
            itemBuilder: (context, index) {
              final city = filteredCities[index];
              return ListTile(
                leading: Text(
                  getFlagEmoji(city.country),
                  style: AppTextStyles.style22WhiteW500,
                ),
                title: Text(city.name),
                subtitle: Text(city.country),
                onTap: () {
                  widget.onCitySelected(city);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
