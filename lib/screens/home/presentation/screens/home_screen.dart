import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/di/injection_container.dart';
import 'package:weather/screens/home/presentation/manager/home_cubit.dart';
import 'package:weather/screens/home/presentation/manager/home_state.dart';
import 'package:weather/screens/home/presentation/screens/home_body.dart';
import 'package:weather/screens/home/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {

          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              centerTitle: true,
              title: Text(AppStrings.appName),
              backgroundColor: Colors.transparent,
              elevation: 0,
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
