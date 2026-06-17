// ignore_for_file: file_names

import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Authors/data/models/author_model.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_cubit.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_state.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_widget.dart';
import 'package:bazzar_app/features/Vendors/data/models/vendor_model.dart';
import 'package:bazzar_app/features/home/presentation/widgets/home_section_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/type_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TypeBannerWidget(title: "Top of Week"),
            SizedBox(height: 5),
            BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.grey500),
                  );
                }
                if (state is BookSuccess) {
                  return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.books.length,
                      itemBuilder: (context, index) {
                        return BookWidget(book: state.books[index]);
                      },
                    ),
                  );
                }
                return Center(child: Text("Error Can`t Fetch Data"));
              },
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
    );
  }
}
