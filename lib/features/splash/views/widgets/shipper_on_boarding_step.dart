import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/assets/lotties/app_lotties.dart';
import 'package:rental_app/features/splash/views/widgets/custom_on_boarding_details.dart';

class ShipperOnBoardingStep extends StatelessWidget {
  const ShipperOnBoardingStep({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingDetails(
      image: AppLotties.shipperLottie,
      title: "List Your Property with Ease",
      description:
          "Reach potential tenants quickly. List your property in just a few steps and start earning today!",
    );
  }
}
