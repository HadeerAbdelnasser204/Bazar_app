// ignore_for_file: must_be_immutable

import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.rate,
    required this.iconSize,
    required this.isBook,
  });

  final double rate;
  final double iconSize;
  final bool isBook;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isBook
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      children: [
        ...List.generate(5, (index) {
          return SvgPicture.asset(
            AppAssets.starIcon,
            width: iconSize,
            height: iconSize,
            color: index < rate.floor()
                ? AppColors.yellow
                : const Color.fromARGB(213, 0, 0, 0),
          );
        }),
        const SizedBox(width: 5),
        Text(
          '($rate)',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
