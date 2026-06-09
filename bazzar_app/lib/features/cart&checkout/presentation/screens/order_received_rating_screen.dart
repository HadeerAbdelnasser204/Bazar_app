import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderReceivedRatingScreen extends StatefulWidget {
  const OrderReceivedRatingScreen({super.key});

  @override
  State<OrderReceivedRatingScreen> createState() =>
      _OrderReceivedRatingScreenState();
}

class _OrderReceivedRatingScreenState extends State<OrderReceivedRatingScreen> {
  int _rating = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Image.asset('assets/images/Group.png', height: 180),
                      const SizedBox(height: 24),
                      Text(
                        'You Received The Order!',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h3.copyWith(
                          color: AppColors.grey900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Order #2930541',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.grey500,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.primary50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Tell us your feedback 🙌',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.h5.copyWith(
                                color: AppColors.primary500,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Lorem ipsum dolor sit amet consectetur. Dignissim magna vitae.',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.primary400,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                final isFilled = index < _rating;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() => _rating = index + 1);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    child: Icon(
                                      isFilled
                                          ? Icons.star_rounded
                                          : Icons.star_outline_rounded,
                                      color: isFilled
                                          ? AppColors.yellow
                                          : AppColors.grey300,
                                      size: 36,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 12),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Write something for us!',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.grey900,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomeButton(
                text: 'Done',
                onPressed: () => context.go(AppRoutes.homeScreen),
                buttonColor: AppColors.primary500,
                textColor: AppColors.white,
                borderSide: BorderSide.none,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
