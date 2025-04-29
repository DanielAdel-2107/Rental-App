import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/renter/home/views/widgets/house_type_card.dart';

class HouseTypeListView extends StatelessWidget {
  const HouseTypeListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.065,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return HouseTypeCard(
            index: index,
          );
        },
      ),
    );
  }
}
