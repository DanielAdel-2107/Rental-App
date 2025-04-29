import 'package:flutter/material.dart';
import 'package:rental_app/features/owner/sell_ease/views/widgets/custom_owner_speed_dial.dart';
import 'package:rental_app/features/owner/sell_ease/views/widgets/sell_ease_screen_body.dart';

class SellEaseScreen extends StatelessWidget {
  const SellEaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SellEaseScreenBody(),
      floatingActionButton: CustomOwnerSpeedDial(),
    );
  }
}