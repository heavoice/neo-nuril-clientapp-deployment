import 'package:flutter/material.dart';
import '../../widgets/cart_item_widget.dart';
import 'package:neo_nuril_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CartListContent();
  }
}

class _CartListContent extends StatelessWidget {
  const _CartListContent();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    if (cartItems.isEmpty) {
      return Container(
        constraints: const BoxConstraints(maxWidth: 1400),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(top: 30),
        child: Center(
          child: Column(
            children: [
              Text(
                "Cart is empty!",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth < 600 ? 12 : 16,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      constraints: const BoxConstraints(maxWidth: 1400),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          ...List.generate(
            cartItems.length,
            (index) => CartItemWidget(item: cartItems[index]),
          ),
        ],
      ),
    );
  }
}
