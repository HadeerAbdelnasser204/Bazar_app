// ignore_for_file: deprecated_member_use

import 'package:bazzar_app/features/Books/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key, required this.book});
  final BookModel book;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  final double iconSize = 28;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Image(
                    width: 200,
                    height: 300,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.book.image),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.book.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/Icon/Love-Fill.svg",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
              Text(
                widget.book.vendor,
                style: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 255, 123, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.book.description,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 25),

              Text(
                "Review",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Row(
                children: [
                  ...List.generate(5, (index) {
                    if (index < widget.book.rate.floor()) {
                      return SvgPicture.asset(
                        "assets/Icon/Star.svg",
                        width: iconSize,
                        height: iconSize,
                        color: const Color(0xFFFFC107),
                      );
                    } else {
                      return SvgPicture.asset(
                        "assets/Icon/Star.svg",
                        width: iconSize,
                        height: iconSize,
                        color: const Color.fromARGB(213, 0, 0, 0),
                      );
                    }
                  }),
                  SizedBox(width: 5),
                  Text(
                    '(${widget.book.rate})',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 40),

              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove, size: 20),
                    ),
                  ),

                  const SizedBox(width: 10),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF54408C),
                    ),

                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    '\$${widget.book.price * quantity}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF54408C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF54408C),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Continue Shopping",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "View Cart",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF54408C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
