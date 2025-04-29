 import 'package:flutter/material.dart';
import 'package:rental_app/features/owner/requests/views/widgets/show_my_requests_screen_body.dart';

class ShowMyRequestScreen extends StatelessWidget {
  const ShowMyRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String id = arguments!['id'];
    return Scaffold(
      body: ShowMyRequestScreenBody(
        id: id,
      ),
    );
  }
}

