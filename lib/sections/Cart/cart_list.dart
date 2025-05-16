import 'package:flutter/material.dart';
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
          child: const Center(child: Text("Keranjang masih kosong")));
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: List.generate(cartItems.length, (index) {
          final item = cartItems[index];
          return Container(
            constraints: const BoxConstraints(maxWidth: 1400),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(top: 30),
            child: ListTile(
              leading: Image.asset(
                item.imagePath,
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image),
              ),
              title: Text(
                item.title,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth < 600 ? 12 : 16),
              ),
              subtitle: Text('Qty: ${item.quantity}'),
              trailing: Text(
                '\$ ${item.price}',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
              ),
            ),
          );
        }),
      ),
    );
  }
}
