import 'package:bazzar_app/core/Di/get_it.dart';
import 'package:bazzar_app/features/Authors/data/models/author_model.dart';
import 'package:bazzar_app/features/Authors/presentation/screens/author_details.dart';
import 'package:bazzar_app/features/Authors/presentation/screens/authors_screen.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_cubit.dart';
import 'package:bazzar_app/features/Books/presentation/screens/books_screen.dart';
import 'package:bazzar_app/features/Vendors/presentation/cubit/vendor_cubit.dart';
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

import 'package:bazzar_app/features/cart&checkout/presentation/screens/confirm_order_screen.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/screens/order_received_rating_screen.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/screens/order_status.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/screens/cart_screen.dart';

import 'package:bazzar_app/features/location/presentation/screens/add_address_screen.dart';
import 'package:bazzar_app/features/location/presentation/screens/location_screen.dart';
import 'package:bazzar_app/features/notifications/presentation/screens/notification_screen.dart';

import 'package:bazzar_app/features/categories/presentation/screens/categories_screen.dart';
import 'package:bazzar_app/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:bazzar_app/features/order/presentation/screens/order_history_screen.dart';
import 'package:bazzar_app/features/profile/presentation/screens/account_screen.dart';
import 'package:bazzar_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:bazzar_app/features/search/presentation/screens/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

class AppRoutes {
  // ------------ Initial Screens ------------ //
  static const String splashScreen = '/splash_screen';
  static const String onboardingScreen = '/onboarding';

  // ------------ Authentication Screens ------------ //
  static const String loginScreen = '/login_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String verifyScreen = '/verify_screen';
  static const String forgetPasswordScreen = '/forget_password';
  static const String newPasswordScreen = '/new_password';
  static const String passwordChangedSuccessScreen =
      '/password_changed_success';
  static const String chooseSignUpMethodScreen =
      '/choose_sign_up_method_screen';

  // ------------ App Main Screens ------------ //
  static const String homeScreen = '/home';
  static const String bookScreen = '/books_screen';

  static const String categoryScreen = '/category_screen';
  static const String authorScreen = '/authors_screen';
  static const String authorDetailsScreen = '/author_details';
  static const String vendorScreen = '/vendors_screen';

  // ------------ Cart & Checkout ------------ //
  static const String notificationScreen = '/notification_screen';
  static const String cartScreen = '/cart_screen';
  static const String confirmOrder = '/confirm_screen';
  static const String orderStatus = '/order_status';
  static const String orderReceivedRating = '/order_received_rating';
  static const String locationScreen = '/location_screen';
  static const String addAddress = '/address_screen';

  // ------------ New Features ------------ //
  static const String searchScreen = '/search_screen';
  static const String profileScreen = '/profile_screen';
  static const String account = '/account_screen';
  static const String favorites = '/favorites_screen';
  static const String orderHistory = '/order_history_screen';
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.homeScreen,
  routes: [
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboardingScreen,
      builder: (_, __) => const OnboardingScreen(),
    ),

    // ------------ Auth ------------ //
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

    // ------------ Main ------------ //
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.bookScreen,
      builder: (context, state) => BlocProvider(
        create: (_) => sl<BookCubit>()..fetchAllBooks(),
        child: const BooksScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.categoryScreen,
      builder: (context, state) => const CategoriesScreen(),
    ),
    GoRoute(
      path: AppRoutes.authorScreen,
      builder: (context, state) => const AuthorsScreen(),
    ),

    GoRoute(
      path: AppRoutes.vendorScreen,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => sl<VendorCubit>()..fetchVendors(),
          child: const VendorsScreen(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.authorDetailsScreen,
      builder: (context, state) {
        final author = state.extra as AuthorModel;
        return AuthorDetails(author: author);
      },
    ),

    // ------------ Cart & Checkout ------------ //
    GoRoute(
      path: AppRoutes.notificationScreen,
      builder: (context, state) {
        final isEmpty = state.uri.queryParameters['empty'] == 'true';
        return NotificationScreen(notifications: isEmpty ? const [] : null);
      },
    ),
    GoRoute(
      path: AppRoutes.cartScreen,
      builder: (context, state) {
        final isEmpty = state.uri.queryParameters['empty'] == 'true';
        return CartScreen(items: isEmpty ? const [] : null);
      },
    ),
    GoRoute(
      path: AppRoutes.confirmOrder,
      builder: (context, state) => const ConfirmOrderScreen(),
    ),
    GoRoute(
      path: AppRoutes.orderStatus,
      builder: (context, state) => const OrderStatusScreen(),
    ),
    GoRoute(
      path: AppRoutes.orderReceivedRating,
      builder: (context, state) => const OrderReceivedRatingScreen(),
    ),
    GoRoute(
      path: AppRoutes.locationScreen,
      builder: (context, state) => const LocationScreen(),
    ),
    GoRoute(
      path: AppRoutes.addAddress,
      builder: (context, state) => const AddAddressScreen(),
    ),

    // ------------ New Features ------------ //
    GoRoute(
      path: AppRoutes.searchScreen,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: AppRoutes.profileScreen,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.account,
      builder: (context, state) => const AccountScreen(),
    ),
    GoRoute(
      path: AppRoutes.favorites,
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: AppRoutes.orderHistory,
      builder: (context, state) => const OrderHistoryScreen(),
    ),
  ],
);
