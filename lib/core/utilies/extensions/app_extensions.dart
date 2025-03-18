import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/features/auth/view_models/sign_in_cubit/sign_in_cubit.dart';
import 'package:rental_app/features/auth/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:rental_app/features/renter/home/view_models/cubit/search_for_house_cubit.dart';
import 'package:rental_app/features/renter/select_item/view_models/cubit/select_item_cubit.dart';
import 'package:rental_app/features/splash/view_models/on_boarding_screen_cubit/on_boarding_screen_cubit.dart';

extension AppExtensions on BuildContext {
  //features/media query
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  // cubit
  OnBoardingScreenCubit get onBoardingScreenCubit => BlocProvider.of(this);
  SignInCubit get signInCubit => BlocProvider.of(this);
  SignUpCubit get signUpCubit => BlocProvider.of(this);
  SearchForHouseCubit get searchForHouseCubit => BlocProvider.of(this);
  SelectItemCubit get selectItemCubit => BlocProvider.of(this);

  // navigation
  void pushScreen(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementScreen(String routeName) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }

  void pushAndRemoveUntilScreen(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  void popScreen() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }

  void popWithResult<T>(T result) {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop(result);
    }
  }

  bool canPopScreen() {
    return Navigator.of(this).canPop();
  }
}
