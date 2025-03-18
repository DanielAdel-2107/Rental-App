import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';

class CustomPageViewBuilder extends StatelessWidget {
  const CustomPageViewBuilder({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.3,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
