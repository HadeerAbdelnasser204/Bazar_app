import 'package:bazzar_app/features/intial_screens/onboarding_screen.dart';
import 'package:bazzar_app/features/intial_screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  //------------Initial Screens------------//
  static const String splashScreen = '/splash_screen';
  static const String onboardingScreen = '/onboarding';

  //------------Authentication Screens------------//
  static const String loginScreen = '/login_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String verifyScreen = '/verify_screen';
  static const String chooseSignUpMethodScreen =
      '/choose_sign_up_method_screen';
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  routes: [
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboardingScreen,
      builder: (_, __) => const OnboardingScreen(),
    ),
    // GoRoute(
    //   path: AppRoutes.loginScreen,
    //   builder: (context, state) => const LoginScreen(),
    // ),
    // GoRoute(
    //   path: AppRoutes.signUpScreen,
    //   builder: (context, state) => const SignUpScreen(),
    // ),
    // GoRoute(
    //   path: AppRoutes.verifyScreen,
    //   builder: (context, state) => const VerifyScreen(),
    // ),
    // GoRoute(
    //   path: AppRoutes.chooseSignUpMethodScreen,
    //   builder: (context, state) => const ChooseSignUpMethodScreen(),
    // ),
  ],
);
