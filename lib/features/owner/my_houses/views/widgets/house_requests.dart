import 'package:flutter/material.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';

class HouseRequests extends StatelessWidget {
  const HouseRequests({super.key, required this.requests, required this.id});
  final int requests;
  final String id;
  @override
  Widget build(BuildContext context) {
    return requests != 0
        ? SizedBox(
          width: context.width * 0.2,
          child: GestureDetector(
              onTap: () {
                context.pushScreen(RouteNames.showMyRequestScreen,
                    arguments: {"id": id});
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.05,
                      vertical: context.height * 0.005,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      requests.toString(),
                      style: AppTextStyles.title16White500,
                    ),
                  ),
                  Text(
                    "View Requests",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.title18RedColorW500,
                  )
                ],
              ),
            ),
        )
        : Container();
  }
}
