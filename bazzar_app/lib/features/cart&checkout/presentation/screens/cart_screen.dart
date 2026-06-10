import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/cart&checkout/data/models/cart_item_model.dart';
import 'package:bazzar_app/features/cart&checkout/presentation/widgets/cart_body.dart';
import 'package:bazzar_app/features/home/presentation/widgets/bottom_navigation_Bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, this.items});

  final List<CartItemModel>? items;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<CartItemModel> _items;

  @override
  void initState() {
    super.initState();
    _items = _copyItems(widget.items ?? dummyCartItems);
  }

  List<CartItemModel> _copyItems(List<CartItemModel> source) {
    return source
        .map(
          (item) => CartItemModel(
            id: item.id,
            title: item.title,
            image: item.image,
            price: item.price,
            vendor: item.vendor,
            quantity: item.quantity,
          ),
        )
        .toList();
  }

  int get _cartItemCount =>
      _items.fold<int>(0, (sum, item) => sum + item.quantity);

  void _updateQuantity(int index, int quantity) {
    setState(() => _items[index].quantity = quantity);
  }

  void _removeItem(int index) {
    setState(() => _items.removeAt(index));
  }

  void _onOrderNow() {
    context.push(AppRoutes.confirmOrder);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () => context.push(AppRoutes.notificationScreen),
                icon: SvgPicture.asset(
                  AppAssets.notificationIcon,
                  width: 24,
                  height: 24,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: CartBody(
        items: _items,
        onQuantityChanged: _updateQuantity,
        onRemove: _removeItem,
        onOrderNow: _onOrderNow,
      ),

      bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 2),
    );
  }
}
