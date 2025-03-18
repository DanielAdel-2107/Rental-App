import 'package:flutter/material.dart';
import 'package:rental_app/core/app_route/route_names.dart';
import 'package:rental_app/features/auth/views/screens/auth_screen.dart';
import 'package:rental_app/features/auth/views/screens/select_role_screen.dart';
import 'package:rental_app/features/owner/chat/views/screens/chat_screen.dart';
import 'package:rental_app/features/owner/my_houses/views/screens/my_houses_screen.dart';
import 'package:rental_app/features/owner/profile/views/screens/profile_screen.dart';
import 'package:rental_app/features/owner/requests/views/screens/request_details_screen.dart';
import 'package:rental_app/features/owner/requests/views/screens/show_my_request_screen.dart';
import 'package:rental_app/features/owner/sell_ease/views/screens/sell_ease_screen.dart';
import 'package:rental_app/features/renter/home/views/screens/home_screen.dart';
import 'package:rental_app/features/renter/my_requests/views/screens/my_requests_screen.dart';
import 'package:rental_app/features/renter/select_item/views/screens/Select_item_screen.dart';
import 'package:rental_app/features/splash/views/screens/on_boarding_screen.dart';
import 'package:rental_app/features/splash/views/screens/splash_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.onBoardingScreen: (context) => const OnBoardingScreen(),
    RouteNames.selectRoleScreen: (context) => const SelectRoleScreen(),
    RouteNames.authScreen: (context) => const AuthScreen(),
    RouteNames.renterHomeScreen: (context) => const RenterHomeScreen(),
    RouteNames.selectItemScreen: (context) => SelectItemScreen(),
    RouteNames.sellEaseScreen: (context) => SellEaseScreen(),
    RouteNames.myHousesScreen: (context) => MyHousesScreen(),
    RouteNames.showMyRequestScreen: (context) => ShowMyRequestScreen(),
    RouteNames.requestDetailsScreen: (context) => RequestDetailsScreen(),
    RouteNames.chatScreen: (context) => ChatScreen(),
    RouteNames.renterRequestsScreen: (context) => MyRequestsScreen(),
    RouteNames.profileScreen: (context) => ProfileScreen(),

  };
}
