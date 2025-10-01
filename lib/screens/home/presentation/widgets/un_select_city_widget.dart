import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/core/constants/app_text_styles.dart';
import 'package:weather/screens/home/presentation/manager/home_cubit.dart';
import 'package:weather/screens/home/presentation/widgets/select_country_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class UnSelectCityWidget extends StatefulWidget {
  const UnSelectCityWidget({super.key});

  @override
  State<UnSelectCityWidget> createState() => _UnSelectCityWidgetState();
}

class _UnSelectCityWidgetState extends State<UnSelectCityWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool showButton = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
        );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextFinished() {
    setState(() {
      showButton = true;
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const Spacer(flex: 2),

            Icon(
              Icons.location_city_outlined,
              size: 80.sp,
              color: AppColors.whiteColor.withValues(alpha: 0.7),
            ),
            SizedBox(height: 20.h),

            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  AppStrings.pleaseSelectACityForReviewWeather,
                  textAlign: TextAlign.center,
                  textStyle: AppTextStyles.style22BlueDarkW700,
                ),
              ],
              totalRepeatCount: 1,
              onFinished: _onTextFinished,
            ),

            const Spacer(flex: 1),


            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: child,
                      ),
                    );
                  },
                  child: Builder(
                    builder: (context) {
                      final cubit = context.read<HomeCubit>();
                      return SelectCountryWidget(
                        cubit: cubit,
                        title: AppStrings.selectACity,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
