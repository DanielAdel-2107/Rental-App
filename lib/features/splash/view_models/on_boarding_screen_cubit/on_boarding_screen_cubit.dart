import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/cache/cache_helper.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/splash/view_models/on_boarding_screen_cubit/on_boarding_screen_state.dart';
import 'package:rental_app/features/splash/views/widgets/renter_on_boarding_step.dart';
import 'package:rental_app/features/splash/views/widgets/shipper_on_boarding_step.dart';
import 'package:rental_app/features/splash/views/widgets/welcome_on_boarding_step.dart';

class OnBoardingScreenCubit extends Cubit<OnBoardingScreenState> {
  OnBoardingScreenCubit() : super(OnBoardingScreenInitial()){
    getIt<CacheHelper>().saveData(key: "showOnBoarding", value: "true");
  }
  int _currentPageIndex = 0;
  final pageController = PageController();
  final List<Widget> onBoardingSteps = [
    WelcomeOnBoardingStep(),
    RenterOnBoardingStep(),
    ShipperOnBoardingStep(),
  ];
  changePage(int index) {
    _currentPageIndex = index;
  }

  void nextPage({required BuildContext context}) {
    if (_currentPageIndex < onBoardingSteps.length - 1) {
      changePage(_currentPageIndex + 1);
      pageController.animateToPage(
          duration: Duration(milliseconds: 500),
          _currentPageIndex,
          curve: Curves.linear);
    } else {
      context.pushReplacementScreen(RouteNames.selectRoleScreen);
    }
  }

  void previousPage() {
    if (_currentPageIndex > 0) {
      changePage(_currentPageIndex - 1);
      pageController.animateToPage(
          duration: Duration(milliseconds: 500),
          _currentPageIndex,
          curve: Curves.linear);
    }
  }
}
