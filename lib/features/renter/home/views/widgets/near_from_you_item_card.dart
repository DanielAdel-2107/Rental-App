import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';

class NearFormYouItem extends StatelessWidget {
  const NearFormYouItem({
    super.key,
    required this.house, this.onTap,
  });
  final HouseModel house;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: context.width * 0.03),
        width: context.width * 0.5,
        constraints: BoxConstraints(
          minHeight: context.height * 0.3,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(house.image.first),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
          gradient: const LinearGradient(
            colors: [
              Colors.black,
              Colors.black,
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.03,
            vertical: context.height * 0.01,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.02,
                  vertical: context.height * 0.01,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  spacing: context.width * 0.01,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on, color: Colors.white),
                    Row(
                      children: [
                        SizedBox(
                          width: context.width * 0.25,
                          child: Text(
                            (house.distance! / 1000).toStringAsFixed(5),
                            style: AppTextStyles.title16White500,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          " Km",
                          style: AppTextStyles.title16White500,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    house.title,
                    style: AppTextStyles.title20WhiteW500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    house.description,
                    style: AppTextStyles.title16LightGreyW500,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
