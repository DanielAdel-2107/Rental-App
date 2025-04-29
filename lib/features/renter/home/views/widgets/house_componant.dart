import 'package:flutter/material.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';

class HouseComponant extends StatelessWidget {
  const HouseComponant({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.width * 0.02,      
      children: [
        Icon(icon, size: 20),
        Text(title, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
