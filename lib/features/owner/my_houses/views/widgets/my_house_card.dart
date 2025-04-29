import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';
import 'package:rental_app/features/owner/my_houses/views/widgets/house_details.dart';
import 'package:rental_app/features/owner/my_houses/views/widgets/house_requests.dart';
import 'package:rental_app/features/owner/my_houses/views/widgets/image_builder.dart';
import 'package:rental_app/features/renter/select_item/views/widgets/custom_smooth_page_indecator.dart';

class MyHouseCard extends StatelessWidget {
  const MyHouseCard({
    super.key,
    required this.houseModel,
    required this.controller,
  });
  final HouseModel houseModel;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      child: SizedBox(
        height: context.height * 0.5,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.03,
            vertical: context.height * 0.02,
          ),
          child: Column(
            children: [
              ImageBuilder(images: houseModel.image),
              SmoothPageIndecator(
                controller: controller,
                count: houseModel.image.length,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HouseDetails(houseModel: houseModel),
                    HouseRequests(requests: houseModel.request,id: houseModel.id,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}