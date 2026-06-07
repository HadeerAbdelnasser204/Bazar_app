import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/notifications/data/models/notification_model.dart';
import 'package:bazzar_app/features/notifications/presentation/widgets/notification_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key, this.notifications});

  final List<NotificationModel>? notifications;

  @override
  Widget build(BuildContext context) {
    final items = notifications ?? dummyNotifications;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(
            AppAssets.arrowLeftIcon,
            width: 24,
            height: 24,
          ),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
        ),
      ),
      body: NotificationBody(notifications: items),
    );
  }
}
