import 'package:flutter/material.dart';
import 'package:rental_app/features/renter/my_requests/view_models/cubit/my_requests_cubit.dart';
import 'package:rental_app/features/renter/my_requests/views/widgets/request_card.dart';

class RequestsListView extends StatelessWidget {
  const RequestsListView({
    super.key,
    required this.cubit,
  });

  final MyRequestsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cubit.requests.length,
        itemBuilder: (context, index) => RequetCard(
          request: cubit.requests[index],
          controller: cubit.pageController,
          onPressed: () async {
            await cubit.deleteRequest(id: cubit.requests[index].requestId);
          },
        ),
      ),
    );
  }
}
