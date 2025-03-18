import 'package:flutter/material.dart';

class CustomImageBuilder extends StatelessWidget {
  const CustomImageBuilder({
    super.key,
    required this.images,
    required this.controller,
  });

  final List<String> images;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: images.length,
      allowImplicitScrolling: true,
      pageSnapping: true,
      controller: controller,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            images[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
