import 'package:flutter/material.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/requests/models/request_model.dart';

class MyRequestListTile extends StatelessWidget {
  const MyRequestListTile({
    super.key,
    required this.requestModel,
  });
  final RequestModel requestModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height * 0.01),
      child: ListTile(
        minLeadingWidth: context.width * 0.15,
        onTap: () {
          context.pushScreen(RouteNames.requestDetailsScreen,
              arguments: requestModel.toJson());
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.primaryColor),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02,
          vertical: context.height * 0.002,
        ),
        leading: Image.network(
          requestModel.images.first,
          fit: BoxFit.fill,
        ),
        title: Text(
          requestModel.price,
          style: AppTextStyles.title20PrimaryColorW500,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          requestModel.description,
          style: AppTextStyles.title18Black,
                    maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
