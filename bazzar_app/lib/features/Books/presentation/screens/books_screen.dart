import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_body.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:flutter/material.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Books', iconPath: AppAssets.searchIcon),
      backgroundColor: Colors.white,
      body: BooksBody(),
    );
  }
}
