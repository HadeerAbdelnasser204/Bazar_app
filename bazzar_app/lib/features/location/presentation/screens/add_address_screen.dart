import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Location', style: AppTextStyles.h5),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(Icons.my_location),
              color: AppColors.primary500,
              onPressed: () => context.push(AppRoutes.locationScreen),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),

                      CustomTextField(label: 'Phone', hintText: 'Phone'),
                      const SizedBox(height: 20),

                      CustomTextField(label: 'Name', hintText: 'Name'),
                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Governorate',
                        hintText: 'Governorate',
                      ),
                      const SizedBox(height: 20),

                      CustomTextField(label: 'City', hintText: 'City'),
                      const SizedBox(height: 20),

                      CustomTextField(label: 'Block', hintText: 'Block'),
                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Street name / number',
                        hintText: 'Street name / number',
                      ),
                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Building name / number',
                        hintText: 'Building name / number',
                      ),
                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Floor (optional)',
                        hintText: 'Floor (optional)',
                      ),
                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Flat (optional)',
                        hintText: 'Flat (optional)',
                      ),
                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Avenue (optional)',
                        hintText: 'Avenue (optional)',
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomeButton(
                  text: 'Confirmation',
                  onPressed: () {
                    context.push(AppRoutes.confirmOrder);
                  },
                  buttonColor: AppColors.primary500,
                  textColor: AppColors.white,
                  borderSide: BorderSide.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
