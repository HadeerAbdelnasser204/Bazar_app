// ignore_for_file: deprecated_member_use

import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Authors/data/models/author_model.dart';
import 'package:bazzar_app/features/Authors/presentation/widgets/author_detalis_body.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:flutter/material.dart';

class AuthorDetails extends StatelessWidget {
  const AuthorDetails({super.key, required this.author});
  final AuthorModel author;
  final double iconSize = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(title: 'Authors'),
      body: AuthorDetailsBody(author: author, iconSize: iconSize),
    );
  }
}
