import 'package:bazzar_app/core/routes/app_routes.dart' as AppRoutes;
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            fontFamily: "Roboto",
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.router,
        );
      },
    );
  }
}
