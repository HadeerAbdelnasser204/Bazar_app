import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:bazzar_app/features/order/presentation/widgets/order_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: "Order History",
        leadingIconPath: AppAssets.arrowBackIcon,
        leadingOnPressed: () {
          context.pop();
        },
      ),
      body: OrderHistoryBody(),
    );
  }
}
