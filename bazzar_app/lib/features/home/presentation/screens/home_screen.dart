import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text('Home', style: AppTextStyles.h4),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Welcome to Bazar',
          style: AppTextStyles.h3,
        ),
      ),
    );
  }
}
