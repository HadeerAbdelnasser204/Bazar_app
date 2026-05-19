import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        selectedItemColor: const Color(0xFF54408C),
        unselectedItemColor: Colors.grey,

        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),

        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/Icon/Home-Fill.svg",

              colorFilter: ColorFilter.mode(
                currentIndex == 0 ? const Color(0xFF54408C) : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/Icon/Menu-Fill.svg",

              colorFilter: ColorFilter.mode(
                currentIndex == 1 ? const Color(0xFF54408C) : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: "Category",
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/Icon/Cart-Fill.svg",

              colorFilter: ColorFilter.mode(
                currentIndex == 2 ? const Color(0xFF54408C) : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: "Cart",
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/Icon/Profile-Fill.svg",

              colorFilter: ColorFilter.mode(
                currentIndex == 3 ? const Color(0xFF54408C) : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
