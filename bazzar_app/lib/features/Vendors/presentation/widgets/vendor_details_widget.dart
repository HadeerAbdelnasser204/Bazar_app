import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VendorDetailsWidget extends StatelessWidget {
  const VendorDetailsWidget({
    super.key,
    required this.image,
    required this.description,
    required this.rate,
  });

  final String image;
  final String description;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: 110,
            height: 110,

            decoration: BoxDecoration(
              color: Colors.grey[200],

              borderRadius: BorderRadius.circular(10),
            ),

            child: Center(
              child: Image(
                width: 70,
                height: 70,
                fit: BoxFit.contain,
                image: AssetImage(image),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            description,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 6),

          Row(
            children: List.generate(5, (index) {
              if (index < rate.floor()) {
                return SvgPicture.asset(
                  "assets/Icon/Star.svg",
                  width: 17,
                  height: 17,
                  color: const Color(0xFFFFC107),
                );
              } else {
                return SvgPicture.asset(
                  "assets/Icon/Star.svg",
                  width: 17,
                  height: 17,
                  color: const Color.fromARGB(213, 0, 0, 0),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
