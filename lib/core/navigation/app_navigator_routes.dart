import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/core/navigation/app_routes.dart';
import 'package:weather/screens/forecast/presentation/screens/forecast_screen.dart';
import 'package:weather/screens/home/presentation/screens/home_screen.dart';

class AppNavigationRoutes {
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey<
      NavigatorState>();

  static final BuildContext context = navigatorState.currentContext!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _route(const HomeScreen());
      case AppRoutes.forecast:
        return _route(const ForecastScreen());
        // case AppRoutes.favorites:
        //   return _route(const FavoritesScreen());
      default:
        return CupertinoPageRoute(builder: (_) => Container());
    }
  }

  static PageRoute _route(Widget child, {dynamic arguments}) {
    return MaterialPageRoute(
      builder: (_) => child,
      settings: RouteSettings(
        arguments: arguments,
      ),
    );
  }

  static void pop({dynamic result}) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(result);
    }
  }

  static void exit() {
    SystemNavigator.pop();
  }

  static Future push(String routeName, {
    arguments,
    bool replace = false,
    bool clean = false,
  }) {
    if (clean) {
      //navigateAndFinish
      return navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments);
    } else if (replace) {
      //For example, after submitting a form, you may want to replace the form screen with a success screen.
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      //navigateTo
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }
}
