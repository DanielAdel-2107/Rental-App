import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/utilies/colors/app_colors.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/owner/requests/view_models/show_my_requests_cubit/show_my_request_cubit.dart';
import 'package:rental_app/features/owner/requests/views/widgets/custom_title.dart';
import 'package:rental_app/features/owner/requests/views/widgets/my_request_list_tile.dart';

class ShowMyRequestScreenBody extends StatelessWidget {
  const ShowMyRequestScreenBody({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowMyRequestCubit(id: id),
      child: BlocBuilder<ShowMyRequestCubit, ShowMyRequestState>(
        builder: (context, state) {
          if (state is ShowMyRequestLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
          if (state is ShowMyRequestEmpty) {
            return Center(
              child: Text(
                "No request found!",
                style: AppTextStyles.title28PrimaryColorW500,
              ),
            );
          }
          var cubit = context.read<ShowMyRequestCubit>();
          return SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.03,
              vertical: context.height * 0.02,
            ),
            child: Column(
              children: [
                CustomTitle(
                  title: "Requests",
                ),
                SizedBox(
                  height: context.height * 0.03,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.requests.length,
                    itemBuilder: (context, index) {
                      return MyRequestListTile(
                        requestModel: cubit.requests[index],
                      );
                    },
                  ),
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
