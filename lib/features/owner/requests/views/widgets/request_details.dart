import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/components/custom_drop_down_button_form_field.dart';
import 'package:rental_app/core/components/custom_elevated_button.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/my_houses/views/widgets/custom_label.dart';
import 'package:rental_app/features/owner/requests/models/request_model.dart';
import 'package:rental_app/features/owner/requests/view_models/request_details_cubit/request_details_cubit.dart';
import 'package:rental_app/features/owner/requests/views/widgets/chat_icon_button.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({
    super.key,
    required this.requestModel,
    required this.cubit,
  });
  final RequestModel? requestModel;
  final RequestDetailsCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestDetailsCubit, RequestDetailsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.height * 0.01,
          children: [
            CustomLabel(title: "Title", value: requestModel!.title,maxLines: 3,),
            CustomLabel(title: "Description", value: requestModel!.description,maxLines: 5,),
            CustomLabel(title: "Price", value: requestModel!.price),
            CustomLabel(title: "From User", value: requestModel!.userName),
            CustomLabel(
                title: "Report From User", value: requestModel!.repoetFromUser),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Request Status",
                  style: AppTextStyles.title20PrimaryColorW500,
                ),
                CustomDropDownButtonFormField(
                  userRoles: [
                    "In Progress",
                    "Denied",
                    "Accepted",
                  ],
                  controller: cubit.stateController,
                  hintText: requestModel!.requestState,
                ),
              ],
            ),
            SizedBox(height: context.height * 0.01),
            Row(
              spacing: context.width * 0.02,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state is UpdateRequestStateLoading
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomElevatedButton(
                        name: "Save",
                        onPressed: () {
                          cubit.updateRequestState(
                              id: requestModel!.requestId,
                              userId: requestModel!.userId);
                        },
                        width: context.width * 0.7,
                        height: context.height * 0.07,
                      ),
                requestModel!.requestState != "Accepted"
                    ? const SizedBox()
                    : CustomCircleIconButton(
                        onPressed: () {
                          context.pushScreen(
                            RouteNames.chatScreen,
                            arguments:requestModel!.requestId,
                          );
                        },
                        icon: Icons.chat_bubble_rounded,
                      )
              ],
            ),
          ],
        );
      },
    );
  }
}
