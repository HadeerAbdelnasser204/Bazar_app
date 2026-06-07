import 'package:flutter/material.dart';

class LocationMapWidget extends StatelessWidget {
  const LocationMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset('assets/images/Mask Group.png', fit: BoxFit.cover),
    );
  }
}
