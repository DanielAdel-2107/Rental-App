import 'package:flutter/material.dart';
import 'package:rental_app/features/renter/home/views/widgets/custom_renter_speed_dial.dart';
import 'package:rental_app/features/renter/home/views/widgets/renter_home_screen_body.dart';

class RenterHomeScreen extends StatelessWidget {
  const RenterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RenterHomeScreenBody(),
      floatingActionButton: CustomRenterSpeedDial()
    );
  }
}
