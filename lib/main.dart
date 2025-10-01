import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/bloc_observer/bloc_observer.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/di/injection_container.dart';
import 'package:weather/core/navigation/app_navigator_routes.dart';
import 'package:weather/core/navigation/app_routes.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    print('1. Initializing Bloc Observer...');
  }
  Bloc.observer = MyGlobalObserver();

  if (kDebugMode) {
    print('2. Initializing dependencies...');
  }
  await initializeDependencies();

  await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            navigatorKey: AppNavigationRoutes.navigatorState,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                primary: AppColors.primaryColor,
                seedColor: AppColors.blueDarkColor,
                secondary: AppColors.secondaryColor
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme:  GoogleFonts.cairoTextTheme(),
              useMaterial3: true,
            ),
          initialRoute: AppRoutes.home,
          onGenerateRoute: AppNavigationRoutes.generateRoute,
        );
      },
    );
  }
}
