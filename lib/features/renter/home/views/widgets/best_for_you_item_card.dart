import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';
import 'package:rental_app/features/renter/home/views/widgets/house_componant.dart';

class BestForYouItemCard extends StatelessWidget {
  const BestForYouItemCard({
    super.key,
    required this.houseModel,
    this.onTap,
  });
  final HouseModel houseModel;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.01,
        ),
        child: Row(
          spacing: context.width * 0.03,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                houseModel.image.first,
                fit: BoxFit.fill,
                width: context.width * 0.25,
                height: context.height * 0.1,
              ),
            ),
            SizedBox(
              width: context.width *0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    houseModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.title18Black,
                  ),
                  Text(
                    "Rp. ${houseModel.price} /year",
                    style: AppTextStyles.title16PrimaryColorW500,
                  ),
                  Row(
                    spacing: context.width * 0.04,
                    children: [
                      HouseComponant(
                        title: "${houseModel.bedrooms} Bedrooms",
                        icon: Icons.bed_outlined,
                      ),
                      HouseComponant(
                        title: "${houseModel.bathrooms} Bathrooms",
                        icon: Icons.bathtub_outlined,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
