// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/cache/cache_helper.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/auth/models/user_model.dart';
import 'package:rental_app/features/splash/views/widgets/splash_screen_body.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    NavigateToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SplashScreenBody(),
    );
  }

  Future<void> NavigateToNextScreen() {
    return Future.delayed(
      Duration(seconds: 3),
      () {
        if (mounted) {
          if (getIt<SupabaseClient>().auth.currentUser?.id != null) {
            UserModel user = getIt<CacheHelper>().getUserModel()!;
            if (user.role == "Renter") {
              context.pushReplacementScreen(RouteNames.renterHomeScreen);
            } else if (user.role == "Owner") {
              context.pushReplacementScreen(RouteNames.sellEaseScreen);
            }
          } else if (getIt<CacheHelper>().getData(key: "showOnBoarding") ==
              "true") {
            context.pushReplacementScreen(RouteNames.selectRoleScreen);
          } else {
            context.pushReplacementScreen(RouteNames.onBoardingScreen);
          }
        }
      },
    );
  }
}
