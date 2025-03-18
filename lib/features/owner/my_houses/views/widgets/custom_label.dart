import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({
    super.key,
    required this.title,
    required this.value, this.maxLines,
  });
  final String title;
  final String value;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.title20PrimaryColorW500,
        ),
        Text(
          value,
          style: AppTextStyles.title18Black,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
