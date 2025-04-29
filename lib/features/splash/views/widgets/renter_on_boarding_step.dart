import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/assets/lotties/app_lotties.dart';
import 'package:rental_app/features/splash/views/widgets/custom_on_boarding_details.dart';

class RenterOnBoardingStep extends StatelessWidget {
  const RenterOnBoardingStep({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingDetails(
      image: AppLotties.renterLottie,
      title: "Find Your Ideal Home",
      description:
          "Browse a variety of rental options and book your next home hassle-free!",
    );
  }
}
