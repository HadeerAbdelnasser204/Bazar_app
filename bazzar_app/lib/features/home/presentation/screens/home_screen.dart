import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Authors/data/models/author_model.dart';
import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_widget.dart';
import 'package:bazzar_app/features/Vendors/data/models/vendor_model.dart';
import 'package:bazzar_app/features/home/presentation/widgets/bottom_navigation_Bar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/home_section_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/type_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppAssets.searchIcon,
                width: 20,
                height: 20,
              ),
            ),
            Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TypeBannerWidget(title: "Top of Week"),
              SizedBox(height: 5),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: dummyBooks.length,
                  itemBuilder: (context, index) {
                    return BookWidget(book: dummyBooks[index]);
                  },
                ),
              ),
              SizedBox(height: 10),
              TypeBannerWidget(title: "Best Vendors", isVendor: true),
              SizedBox(height: 5),
              SizedBox(
                height: 125,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: dummyVendors.length,
                  itemBuilder: (context, index) {
                    return HomeSectionWidget(
                      image: dummyVendors[index].logo,
                      isVendor: true,
                    );
                  },
                ),
              ),

              TypeBannerWidget(title: "Best Authors", isCircle: true),
              SizedBox(height: 5),

              SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: dummyAuthors.length,
                  itemBuilder: (context, index) {
                    return HomeSectionWidget(
                      image: dummyAuthors[index].image,
                      description: dummyAuthors[index].name,
                      role: dummyAuthors[index].role,
                      isCircle: true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
