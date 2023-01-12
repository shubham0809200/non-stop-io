import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:non_stop_io/blocs/home/home_bloc.dart';
import 'package:non_stop_io/core/route_constants.dart';
import 'package:non_stop_io/services/product_repo.dart';
import 'package:non_stop_io/ui/screens/home_screen.dart';
import 'package:non_stop_io/ui/screens/login_screen.dart';
import 'package:non_stop_io/ui/screens/product_details.dart';
import 'package:non_stop_io/ui/screens/profile_screen.dart';
import 'package:non_stop_io/ui/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  GoRouter router = GoRouter(routes: [
    GoRoute(
        name: RouteName.splashScreen,
        path: RoutePath.splashScreen,
        pageBuilder: (context, state) =>
            const MaterialPage(child: SplashScreen())),
    GoRoute(
      name: RouteName.homeScreen,
      path: RoutePath.homeScreen,
      pageBuilder: (context, state) => MaterialPage(
        child: BlocProvider(
          create: (context) => HomeBloc(productRepo: ProductRepoImpl()),
          child: const HomeScreen(),
        ),
      ),
    ),
    GoRoute(
      name: RouteName.loginScreen,
      path: RoutePath.loginScreen,
      pageBuilder: (context, state) => const MaterialPage(child: LoginScreen()),
    ),
    GoRoute(
        name: RouteName.profileScreen,
        path: RoutePath.profileScreen,
        pageBuilder: (context, state) =>
            const MaterialPage(child: ProfileScreen())),
    GoRoute(
        name: RouteName.productDetailsScreen,
        path: RoutePath.productDetailsScreen,
        pageBuilder: (context, state) =>
            const MaterialPage(child: ProductDetail())),
    _errorRoute(),
  ]);
}

// Error Route with GoRoute
GoRoute _errorRoute() {
  return GoRoute(
      path: '/error',
      pageBuilder: (context, state) => const MaterialPage(
          child: Scaffold(body: Center(child: Text('Page Not Found')))));
}
