import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Vendors/data/models/vendor_model.dart';
import 'package:bazzar_app/features/Vendors/presentation/widgets/vendor_details_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/categories_tabs.dart';
import 'package:bazzar_app/features/home/presentation/widgets/page_description_widget.dart';
import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Vendors', iconPath: AppAssets.searchIcon),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageDescriptionWidget(
              description: "Our Vendors",
              subtitle: "Vendors",
            ),

            SizedBox(height: 15),
            CategoriesTabs(
              categories: [
                "All",
                "Books",
                "Poems",
                "Special for you",
                "Stationery",
              ],
            ),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.6,
              ),

              children: List.generate(
                dummyVendors.length,
                (index) => VendorDetailsWidget(
                  image: dummyVendors[index].logo,
                  description: dummyVendors[index].name,
                  rate: dummyVendors[index].rate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
