// ignore_for_file: deprecated_member_use

import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Authors/data/models/author_model.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthorDetails extends StatelessWidget {
  const AuthorDetails({super.key, required this.author});
  final AuthorModel author;
  final double iconSize = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Authors'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(author.image),
                    ),
                    const SizedBox(height: 8),
                    Text(author.role, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    Text(
                      author.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        ...List.generate(5, (index) {
                          if (index < author.rate.floor()) {
                            return SvgPicture.asset(
                              AppAssets.starIcon,
                              width: iconSize,
                              height: iconSize,
                              color: AppColors.yellow,
                            );
                          } else {
                            return SvgPicture.asset(
                              AppAssets.starIcon,
                              width: iconSize,
                              height: iconSize,
                              color: const Color.fromARGB(213, 0, 0, 0),
                            );
                          }
                        }),

                        const SizedBox(width: 5),

                        Text(
                          '(${author.rate})',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "About",
              style: const TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              author.description,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),

            Text(
              "Products",
              style: const TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.75,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(author.products.length, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        author.products[index].image,
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        author.products[index].title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "\$${author.products[index].price}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary500,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
