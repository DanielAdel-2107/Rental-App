import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/core/components/custom_elevated_button.dart';
import 'package:rental_app/core/helper/show_custom_dialog.dart';
import 'package:rental_app/core/utilies/extensions/app_extensions.dart';
import 'package:rental_app/core/utilies/styles/app_text_styles.dart';
import 'package:rental_app/features/renter/home/view_models/cubit/search_for_house_cubit.dart';
import 'package:rental_app/features/renter/home/views/widgets/best_for_you_item_card.dart';
import 'package:rental_app/features/renter/home/views/widgets/home_screen_app_bar.dart';
import 'package:rental_app/features/renter/home/views/widgets/house_type_list_view.dart';
import 'package:rental_app/features/renter/home/views/widgets/near_from_you_list_view.dart';
import 'package:rental_app/features/renter/home/views/widgets/search_with_filter.dart';
import 'package:rental_app/features/renter/home/views/widgets/spacing_between_widgets.dart';
import 'package:rental_app/features/renter/home/views/widgets/title_with_show_more.dart';

class RenterHomeScreenBody extends StatelessWidget {
  const RenterHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.03,
          vertical: context.height * 0.01,
        ),
        child: BlocProvider(
          create: (context) => SearchForHouseCubit(),
          child: BlocConsumer<SearchForHouseCubit, SearchForHouseState>(
            listener: (context, state) {
              if (state is RequestLocationPermission) {
                showCustomDialog(
                  title: "Info",
                  description: "Please enable location",
                  dialogType: DialogType.info,
                );
              }
            },
            builder: (context, state) {
              if (state is SearchForHouseLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is SearchForHouseFailed) {
                return Center(
                    child: Text(
                  "Failed to load data",
                  style: AppTextStyles.title20PrimaryColorW500,
                ));
              }
              if (state is SearchForHouseEmpty) {
                return Center(
                    child: Text(
                  "Empty Houses",
                  style: AppTextStyles.title20PrimaryColorW500,
                ));
              }

              if (state is SearchForHouseSuccess || state is SelectHouseType) {
                final newState = context.searchForHouseCubit.previousState;
                var cubit = context.read<SearchForHouseCubit>();
            
                return CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(child: HomeScreenAppBar()),
                    const SpacingBetweenWidgets(),
                     SliverToBoxAdapter(child: SearchWithFilter(
                      onChanged: (p0) {
                        cubit.searchForHouse(query: p0);
                      },
                    )),
                    const SpacingBetweenWidgets(),
                    const SliverToBoxAdapter(child: HouseTypeListView()),
                    SliverToBoxAdapter(
                      child: TitleWithShowMore(
                        title: "Near from you",
                        onPressed: () {},
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: NearFromYouItemListView(
                          houses: newState?.houses ?? []),
                    ),
                    SliverToBoxAdapter(
                      child: TitleWithShowMore(
                        title: "Best for you",
                        onPressed: () {},
                      ),
                    ),
                    newState!.houses.isEmpty
                        ? SliverToBoxAdapter(
                            child: Center(
                            child: Text(
                              "No houses found",
                              style: AppTextStyles.title18PrimaryColorW500,
                            ),
                          ))
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => BestForYouItemCard(
                                houseModel: newState.houses[index],
                                onTap: () {
                                  context.pushScreen(
                                    RouteNames.selectItemScreen,
                                    arguments: newState.houses[index].toJson(),
                                  );
                                },
                              ),
                              childCount: newState.houses.length,
                            ),
                          ),
                  ],
                );
              }
              return CustomElevatedButton(
                  name: "Get Started",
                  onPressed: () {
                    context
                        .read<SearchForHouseCubit>()
                        .checkLocationPermmision();
                  });
            },
          ),
        ),
      ),
    );
  }
}
