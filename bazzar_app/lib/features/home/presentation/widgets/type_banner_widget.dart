import 'package:flutter/material.dart';

class TypeBannerWidget extends StatelessWidget {
  const TypeBannerWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text("See all", style: TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
