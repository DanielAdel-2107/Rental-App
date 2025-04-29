import 'package:flutter/material.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';
import 'package:rental_app/features/renter/select_item/views/widgets/select_item_screen_body.dart';

class SelectItemScreen extends StatelessWidget {
  const SelectItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final house = args != null ? HouseModel.fromJson(args) : null;
    return Scaffold(
      body: SelectItemScreenBody(house: house!),
    );
  }
}





