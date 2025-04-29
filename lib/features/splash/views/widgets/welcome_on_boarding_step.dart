import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/assets/lotties/app_lotties.dart';
import 'package:rental_app/features/splash/views/widgets/custom_on_boarding_details.dart';

class WelcomeOnBoardingStep extends StatelessWidget {
  const WelcomeOnBoardingStep({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingDetails(
      description:
          "Find the perfect place to rent or list your property with ease. Your journey starts here!",
      image: AppLotties.welcomeLottie,
      title: "Welcome to RentEase!",
    );
  }
}
