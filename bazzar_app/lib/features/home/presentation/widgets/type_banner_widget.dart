import 'package:bazzar_app/features/Authors/presentation/screens/authors_screen.dart';
import 'package:bazzar_app/features/Vendors/presentation/screens/vendors_screen.dart';
import 'package:flutter/material.dart';

class TypeBannerWidget extends StatelessWidget {
  const TypeBannerWidget({
    super.key,
    required this.title,
    this.isVendor = false,
    this.isCircle = false,
  });
  final String title;
  final bool isVendor;
  final bool isCircle;

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
          onPressed: () {
            print(isVendor);

            if (isVendor) {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => VendorsScreen()));
            } else if (isCircle) {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AuthorsScreen()));
            } else {
              // Navigator.of(
              //   context,
              // ).push(MaterialPageRoute(builder: (context) => ()));
            }
          },
          child: Text("See all", style: TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
