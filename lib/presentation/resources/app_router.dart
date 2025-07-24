import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/presentation/forget_password/forget_password_view.dart';
import 'package:mvvm/presentation/login/login_view.dart';
import 'package:mvvm/presentation/main/main_view.dart';
import 'package:mvvm/presentation/onBoarding/view/on_boarding_view.dart';
import 'package:mvvm/presentation/register/register_view.dart';
import 'package:mvvm/presentation/resources/routes.dart';
import 'package:mvvm/presentation/resources/strings_manager.dart';
import 'package:mvvm/presentation/splash/splash_view.dart';
import 'package:mvvm/presentation/store_details/store_details_view.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.splashRoute, // Splash route
  routes: [
    GoRoute(
      path: Routes.splashRoute,
      name: Routes.splashRoute,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: Routes.loginRoute,
      name: Routes.loginRoute,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: Routes.registerRoute,
      name: Routes.registerRoute,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: Routes.forgetPasswordRoute,
      name: Routes.forgetPasswordRoute,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: Routes.mainRoute,
      name: Routes.mainRoute,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      path: Routes.onBoardingRoute,
      name: Routes.onBoardingRoute,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: Routes.storeDetailsRoute,
      name: Routes.storeDetailsRoute,
      builder: (context, state) => const StoreDetailsView(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
    body: const Center(child: Text(AppStrings.noRouteFound)),
  ),
);
