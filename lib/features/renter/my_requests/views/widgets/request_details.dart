import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/features/owner/my_houses/views/widgets/custom_label.dart';
import 'package:rental_app/features/owner/requests/models/request_model.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({
    super.key,
    required this.request,
  });

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomLabel(
              title: "Title",
              maxLines: 2,
              value: request.title),
          CustomLabel(
              title: "Price",
              value: request.price),
          CustomLabel(
              title: "Description",
              value:
                  request.description,
              maxLines: 5),
        ],
      ),
    );
  }
}
