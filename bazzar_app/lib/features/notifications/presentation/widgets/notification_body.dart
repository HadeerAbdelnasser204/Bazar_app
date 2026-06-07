import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/notifications/data/models/notification_model.dart';
import 'package:bazzar_app/features/notifications/presentation/widgets/notification_empty_state.dart';
import 'package:bazzar_app/features/notifications/presentation/widgets/notification_item_widget.dart';
import 'package:flutter/material.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key, required this.notifications});

  final List<NotificationModel> notifications;

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return const NotificationEmptyState();
    }

    final grouped = _groupBySection(notifications);

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: grouped.length,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final entry = grouped.entries.elementAt(index);
        return _NotificationSection(
          title: entry.key,
          notifications: entry.value,
        );
      },
    );
  }

  Map<String, List<NotificationModel>> _groupBySection(
    List<NotificationModel> items,
  ) {
    final map = <String, List<NotificationModel>>{};
    for (final item in items) {
      map.putIfAbsent(item.section, () => []).add(item);
    }
    return map;
  }
}

class _NotificationSection extends StatelessWidget {
  const _NotificationSection({
    required this.title,
    required this.notifications,
  });

  final String title;
  final List<NotificationModel> notifications;

  @override
  Widget build(BuildContext context) {
    final isCurrent = title == notificationSectionCurrent;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 10),
        if (isCurrent)
          _NotificationCard(
            child: NotificationItemWidget(notification: notifications.first),
          )
        else
          _NotificationCard(
            child: Column(
              children: [
                for (var i = 0; i < notifications.length; i++)
                  NotificationItemWidget(
                    notification: notifications[i],
                    showDivider: i < notifications.length - 1,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey200),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
