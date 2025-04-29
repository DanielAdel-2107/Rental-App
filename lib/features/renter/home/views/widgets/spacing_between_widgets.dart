import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';

class SpacingBetweenWidgets extends StatelessWidget {
  const SpacingBetweenWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: context.height * 0.02,
      ),
    );
  }
}
