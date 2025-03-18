import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndecator extends StatelessWidget {
  const SmoothPageIndecator({
    super.key,
    required this.controller,
    this.onDotClicked,
    required this.count,
  });

  final PageController controller;
  final Function(int)? onDotClicked;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
      child: SmoothPageIndicator(
        controller: controller,
        count: count,
        onDotClicked: onDotClicked,
        effect: ExpandingDotsEffect(),
      ),
    );
  }
}
