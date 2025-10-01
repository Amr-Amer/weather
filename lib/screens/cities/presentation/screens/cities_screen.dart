import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/screens/cities/presentation/manager/cities_cubit.dart';
import 'package:weather/screens/cities/presentation/widgets/cities_body.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CitiesCubit()..loadCities(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(AppStrings.favoriteCities),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.skyColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const CitiesBody(),
        ),
      ),
    );

  }
}
