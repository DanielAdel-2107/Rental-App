import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:rental_app/core/utilies/assets/lotties/app_lotties.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(
              AppLotties.splashLottie,
              width: context.width * 0.8,
              height: context.height * 0.5,
            ),
            Text(
              "Rental App",
              style: AppTextStyles.title36PrimaryColorW500,
            ).animate().fadeIn(duration: 600.ms, delay: 300.ms).slideY(
                begin: 1, end: 0, duration: 800.ms, curve: Curves.easeOut),
          ],
        ),
      ),
    );
  }
}
