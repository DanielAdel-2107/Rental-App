import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/owner/requests/models/request_model.dart';
import 'package:rental_app/features/renter/my_requests/views/widgets/request_details.dart';
import 'package:rental_app/features/renter/my_requests/views/widgets/request_status.dart';
import 'package:rental_app/features/renter/select_item/views/widgets/custom_smooth_page_indecator.dart';

class RequetCard extends StatelessWidget {
  const RequetCard({
    super.key,
    required this.request,
    required this.controller,
    required this.onPressed,
  });
  final RequestModel request;
  final PageController controller;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.02,
        vertical: context.height * 0.02,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02,
          vertical: context.height * 0.01,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.3,
              child: PageView.builder(
                itemBuilder: (context, i) => Image.network(
                  fit: BoxFit.fill,
                  request.images[i],
                ),
              ),
            ),
            SmoothPageIndecator(
              controller: controller,
              count: request.images.length,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RequestDetails(request: request),
                RequestStatus(
                  request: request,
                  onPressed: onPressed,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
