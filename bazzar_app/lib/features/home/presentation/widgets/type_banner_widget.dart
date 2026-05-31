import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TypeBannerWidget extends StatelessWidget {
  const TypeBannerWidget({
    super.key,
    required this.title,
    this.isVendor = false,
    this.isCircle = false,
  });
  final String title;
  final bool isVendor;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            if (isVendor) {
              context.push(AppRoutes.vendorScreen);
            } else if (isCircle) {
              context.push(AppRoutes.authorScreen);
            } else {
              // Navigator.of(
              //   context,
              // ).push(MaterialPageRoute(builder: (context) => ()));
            }
          },
          child: Text("See all", style: TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
