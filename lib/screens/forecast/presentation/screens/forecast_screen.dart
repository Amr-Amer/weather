import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/di/injection_container.dart';
import 'package:weather/core/navigation/app_navigator_routes.dart';
import 'package:weather/screens/forecast/presentation/manager/forecast_cubit.dart';
import 'package:weather/screens/forecast/presentation/screens/forecast_body.dart';
import 'package:weather/screens/home/presentation/manager/home_cubit.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final cityName = ModalRoute.of(context)?.settings.arguments as String? ?? "Cairo";
    if (kDebugMode) {
      print("City Name: $cityName");
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HomeCubit>()),
        BlocProvider(create: (context) => sl<ForecastCubit>()),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(AppStrings.forecast),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              AppNavigationRoutes.pop();
            },
          ),
        ),
        body: ForecastBody(country: cityName),
      ),
    );
  }
}


