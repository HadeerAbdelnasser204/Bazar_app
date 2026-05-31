import 'package:bazzar_app/features/Authors/data/models/author_model.dart';
import 'package:bazzar_app/features/Authors/presentation/screens/author_details.dart';
import 'package:bazzar_app/features/Authors/presentation/screens/authors_screen.dart';
import 'package:bazzar_app/features/Vendors/presentation/screens/vendors_screen.dart';
import 'package:bazzar_app/features/auth/presentation/screens/forget_password.dart';
import 'package:bazzar_app/features/auth/presentation/screens/login_screen.dart';
import 'package:bazzar_app/features/auth/presentation/screens/new_password.dart';
import 'package:bazzar_app/features/auth/presentation/screens/password_changed_success_screen.dart';
import 'package:bazzar_app/features/auth/presentation/screens/register_screen.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/verify_flow.dart';
import 'package:bazzar_app/features/auth/presentation/screens/verify_screen.dart';
import 'package:bazzar_app/features/home/presentation/screens/home_screen.dart';
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
  static const String forgetPasswordScreen = '/forget_password';
  static const String newPasswordScreen = '/new_password';
  static const String passwordChangedSuccessScreen =
      '/password_changed_success';
  static const String homeScreen = '/home';
  static const String authorScreen = '/authors_screen';
  static const String authorDetailsScreen = '/author_details';
  static const String vendorScreen = '/vendors_screen';
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
    GoRoute(
      path: AppRoutes.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.signUpScreen,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: AppRoutes.verifyScreen,
      builder: (context, state) {
        final email = state.uri.queryParameters['email'];
        final flow = VerifyFlow.fromQuery(state.uri.queryParameters['flow']);
        return VerifyScreen(email: email, flow: flow);
      },
    ),
    GoRoute(
      path: AppRoutes.forgetPasswordScreen,
      builder: (context, state) => const ForgetPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.newPasswordScreen,
      builder: (context, state) => const NewPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.passwordChangedSuccessScreen,
      builder: (context, state) => const PasswordChangedSuccessScreen(),
    ),
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: AppRoutes.authorScreen,
      builder: (context, state) => const AuthorsScreen(),
    ),

    GoRoute(
      path: AppRoutes.vendorScreen,
      builder: (context, state) => const VendorsScreen(),
    ),

    GoRoute(
      path: AppRoutes.authorDetailsScreen,
      builder: (context, state) {
        final author = state.extra as AuthorModel;

        return AuthorDetails(author: author);
      },
    ),
    // GoRoute(
    //   path: AppRoutes.chooseSignUpMethodScreen,
    //   builder: (context, state) => const ChooseSignUpMethodScreen(),
    // ),
  ],
);
