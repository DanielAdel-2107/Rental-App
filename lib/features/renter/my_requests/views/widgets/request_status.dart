import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/requests/models/request_model.dart';
import 'package:rental_app/features/owner/requests/views/widgets/chat_icon_button.dart';
import 'package:rental_app/features/renter/my_requests/view_models/cubit/my_requests_cubit.dart';

class RequestStatus extends StatelessWidget {
  const RequestStatus({
    super.key,
    required this.request,
    required this.onPressed,
  });

  final RequestModel request;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.35,
      child: Column(
        spacing: context.height * 0.01,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.02,
              vertical: context.height * 0.01,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              request.requestState,
              style: AppTextStyles.title20WhiteBold,
            ),
          ),
          request.requestState == "Accepted"
              ? CustomCircleIconButton(
                  icon: Icons.chat_bubble,
                  onPressed: () {
                    context.pushScreen(
                      RouteNames.chatScreen,
                      arguments: request.requestId,
                    );
                  },
                )
              : SizedBox(),
          BlocBuilder<MyRequestsCubit, MyRequestsState>(
            builder: (context, state) {
              return state is DeleteRequestLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ))
                  : CustomCircleIconButton(
                      icon: Icons.delete_forever,
                      onPressed: onPressed,
                    );
            },
          ),
        ],
      ),
    );
  }
}
