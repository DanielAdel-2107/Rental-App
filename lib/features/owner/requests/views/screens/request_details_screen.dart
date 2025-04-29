import 'package:flutter/material.dart';
import 'package:rental_app/features/owner/requests/models/request_model.dart';
import 'package:rental_app/features/owner/requests/views/widgets/request_details_screen_body.dart';

class RequestDetailsScreen extends StatelessWidget {
  const RequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final requestModel = args != null ? RequestModel.fromJson(args) : null;

    return Scaffold(
      body: RequestDetailsScreenBody(requestModel: requestModel),
    );
  }
}

