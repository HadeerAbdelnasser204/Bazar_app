import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/notifications/data/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({
    super.key,
    required this.notification,
    this.showDivider = false,
  });

  final NotificationModel notification;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _NotificationThumbnail(image: notification.image),
              const SizedBox(width: 12),
              Expanded(child: _NotificationDetails(notification: notification)),
            ],
          ),
        ),
        if (showDivider)
          const Divider(height: 1, thickness: 1, color: AppColors.grey200),
      ],
    );
  }
}

class _NotificationThumbnail extends StatelessWidget {
  const _NotificationThumbnail({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Image.asset(image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class _NotificationDetails extends StatelessWidget {
  const _NotificationDetails({required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notification.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              _statusLabel(notification.status),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: _statusColor(notification.status),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                '•',
                style: TextStyle(fontSize: 12, color: AppColors.grey500),
              ),
            ),
            Text(
              '${notification.itemCount} items',
              style: const TextStyle(fontSize: 12, color: AppColors.grey500),
            ),
          ],
        ),
      ],
    );
  }

  String _statusLabel(NotificationStatus status) {
    return switch (status) {
      NotificationStatus.onTheWay => 'On the way',
      NotificationStatus.delivered => 'Delivered',
      NotificationStatus.cancelled => 'Cancelled',
    };
  }

  Color _statusColor(NotificationStatus status) {
    return switch (status) {
      NotificationStatus.onTheWay => AppColors.blue,
      NotificationStatus.delivered => const Color(0xFF34A853),
      NotificationStatus.cancelled => AppColors.red,
    };
  }
}
