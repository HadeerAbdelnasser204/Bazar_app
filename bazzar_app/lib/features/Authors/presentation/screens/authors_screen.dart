import 'package:bazzar_app/features/Authors/presentation/widgets/author_body.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';

import 'package:flutter/material.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Authors',
        iconPath: "assets/Icon/Search.svg",
      ),
      backgroundColor: Colors.white,
      body: AuthorBody(),
    );
  }
}
