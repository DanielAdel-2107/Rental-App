import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';
import 'package:rental_app/features/owner/my_houses/views/widgets/custom_label.dart';

class HouseDetails extends StatelessWidget {
  const HouseDetails({
    super.key,
    required this.houseModel,
  });

  final HouseModel houseModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width *0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomLabel(
            title: "Price",
            value: houseModel.price,
            maxLines: 1,
          ),
          CustomLabel(
            title: "Title",
            value: houseModel.title,
            maxLines: 1,
          ),
          CustomLabel(
            title: "Category",
            value: houseModel.category,
            maxLines: 1,
          ),
          CustomLabel(
            title: "Description",
            value: houseModel.description,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
