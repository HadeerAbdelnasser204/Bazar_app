import 'package:bazzar_app/core/Di/get_it.dart';
import 'package:bazzar_app/core/routes/app_routes.dart' as AppRoutes;
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://hjwrvqvsmulnuevzouog.supabase.co',
    anonKey: "sb_publishable_4ms9HX2Cft2nD-wwMImW5g_NQi4Qcnt",
  );

  setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            fontFamily: "Roboto",
          ),
          routerConfig: AppRoutes.router,
        );
      },
    );
  }
}
