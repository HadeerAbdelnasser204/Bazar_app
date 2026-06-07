import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:bazzar_app/features/location/presentation/widgets/detail_address_section.dart';
import 'package:bazzar_app/features/location/presentation/widgets/location_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String selectedAddressType = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text('Location'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const LocationMapWidget(),

            const SizedBox(height: 16),

            DetailAddressSection(
              selectedAddressType: selectedAddressType,
              onAddressTypeChanged: (value) {
                setState(() {
                  selectedAddressType = value;
                });
              },
            ),

            const SizedBox(height: 20),

            CustomeButton(
              text: 'Confirmation',
              onPressed: () {
                context.push(AppRoutes.addAddress);
              },
              buttonColor: AppColors.primary500,
              textColor: AppColors.white,
              borderSide: BorderSide.none,
            ),
          ],
        ),
      ),
    );
  }
}
