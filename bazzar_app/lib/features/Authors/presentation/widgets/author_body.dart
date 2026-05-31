// ignore_for_file: file_names

import 'package:bazzar_app/features/Authors/data/models/author_model.dart';
import 'package:bazzar_app/features/Authors/presentation/widgets/author_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/categories_tabs.dart';
import 'package:bazzar_app/features/home/presentation/widgets/page_description_widget.dart';
import 'package:flutter/material.dart';

class AuthorBody extends StatelessWidget {
  const AuthorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: ListView(
        children: [
          PageDescriptionWidget(
            description: "Check the authors",
            subtitle: "Authors",
          ),
          SizedBox(height: 20),
          CategoriesTabs(
            categories: [
              "All",
              "Poets",
              "Playwrights",
              "Novelists",
              "Journalists",
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(dummyAuthors.length, (index) {
              return AuthorWidget(author: dummyAuthors[index]);
            }),
          ),
        ],
      ),
    );
  }
}
