import 'package:flutter/material.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/my_houses/models/house_model.dart';
import 'package:rental_app/features/renter/home/views/widgets/near_from_you_item_card.dart';

class NearFromYouItemListView extends StatelessWidget {
  const NearFromYouItemListView({
    super.key,
    required this.houses,
  });
  final List<HouseModel> houses;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: houses.isEmpty ? context.height * 0.1 : context.height * 0.3,
      child: houses.isEmpty
          ? Center(
              child: Text(
                "No houses found",
                style: AppTextStyles.title18PrimaryColorW500,
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: houses.length,
              itemBuilder: (context, index) => NearFormYouItem(
                house: houses[index],
                onTap: () {
                  context.pushScreen(
                    RouteNames.selectItemScreen,
                    arguments: houses[index].toJson(),
                  );
                },
              ),
            ),
    );
  }
}
