
class Routes {
  static const splashRoute = '/';
  static const loginRoute = '/login';
  static const registerRoute = '/register';
  static const forgetPasswordRoute = '/forgetPassword';
  static const mainRoute = '/main';
  static const onBoardingRoute = '/onBoarding';
  static const storeDetailsRoute = '/storeDetails';
}

// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(builder: (_) => SplashView());
//       case Routes.loginRoute:
//         return MaterialPageRoute(builder: (_)=>LoginView());
//       case Routes.registerRoute:
//         return MaterialPageRoute(builder: (_)=>RegisterView());
//       case Routes.forgetPasswordRoute:
//         return MaterialPageRoute(builder: (_)=>ForgetPasswordView());
//       case Routes.mainRoute:
//         return MaterialPageRoute(builder: (_)=>MainView());
//       case Routes.onBoardingRoute:
//         return MaterialPageRoute(builder: (_)=>OnBoardingView());
//       case Routes.storeDetailsRoute:
//         return MaterialPageRoute(builder: (_)=>StoreDetailsView());
//       default:
//         return unDefinedRoute();
//     }
//   }

//   static Route<dynamic> unDefinedRoute() {
//     return MaterialPageRoute(
//       builder: (_) => Scaffold(
//         appBar: AppBar(
//           title: Text('No Route Found'),
//         ),
//         body: Center(
//           child: Text('No Route Found'),
//         ),
//       ),
//     );
//   }
//}
