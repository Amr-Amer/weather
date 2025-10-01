import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/di/injection_container.dart';
import 'package:weather/screens/cities/presentation/manager/cities_cubit.dart';
import 'package:weather/screens/home/presentation/manager/home_cubit.dart';
import 'package:weather/screens/home/presentation/manager/home_state.dart';
import 'package:weather/screens/home/presentation/screens/home_body.dart';
import 'package:weather/screens/home/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<HomeCubit>()),
        BlocProvider(create: (_) => sl<CitiesCubit>()),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              centerTitle: true,
              title: const Text(AppStrings.home),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                state.currentWeather != null
                    ? BlocBuilder<CitiesCubit, List<String>>(
                  builder: (context, cities) {
                    final selectedCity = state.selectedCity?.name;
                    final isSaved = selectedCity != null && cities.contains(selectedCity);

                    return IconButton(
                      icon: Icon(
                        isSaved ? Icons.favorite : Icons.favorite_border,
                        color: isSaved ? Colors.red : Colors.white,
                      ),
                      onPressed: () {
                        if (selectedCity != null) {
                          if (isSaved) {
                            context.read<CitiesCubit>().removeCity(selectedCity);
                          } else {
                            context.read<CitiesCubit>().addCity(selectedCity);
                          }
                        }
                      },
                    );
                  },
                )
                    : const SizedBox(),
              ],
            ),
            drawer: state.currentWeather != null
                ? const Drawer(child: SideMenu())
                : null,
            body: const HomeBody(),
          );
        },
      ),
    );
  }
}
