import 'package:bazzar_app/core/utils/app_assets.dart';

enum NotificationStatus { onTheWay, delivered, cancelled }

class NotificationModel {
  const NotificationModel({
    required this.title,
    required this.image,
    required this.status,
    required this.itemCount,
    required this.section,
  });

  final String title;
  final String image;
  final NotificationStatus status;
  final int itemCount;
  final String section;
}

const String notificationSectionCurrent = 'Current';

List<NotificationModel> dummyNotifications = [
  const NotificationModel(
    title: 'Carrie Fisher',
    image: AppAssets.logo,
    status: NotificationStatus.onTheWay,
    itemCount: 1,
    section: notificationSectionCurrent,
  ),
  const NotificationModel(
    title: 'The Da vinci Code',
    image: AppAssets.logo,
    status: NotificationStatus.delivered,
    itemCount: 1,
    section: 'October 2021',
  ),
  const NotificationModel(
    title: 'Carrie Fisher',
    image: AppAssets.logo,
    status: NotificationStatus.delivered,
    itemCount: 5,
    section: 'October 2021',
  ),
  const NotificationModel(
    title: 'The Waiting',
    image: AppAssets.logo,
    status: NotificationStatus.cancelled,
    itemCount: 2,
    section: 'October 2021',
  ),
];
