import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neo_nuril_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckoutNavigation extends StatelessWidget {
  const CheckoutNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final totalPrice = Provider.of<CartProvider>(context).totalPrice;
    final isMobile = screenWidth < 600;

    return SizedBox(
      height: 100,
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          constraints: BoxConstraints(maxWidth: isMobile ? 600 : 1400),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Carts : \$ ${totalPrice.toStringAsFixed(2)}',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: screenWidth < 600 ? 10 : 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {
                  cartProvider.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Checkout Success!'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 8 : 12,
                    horizontal: isMobile ? 12 : 16,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(9999)),
                  ),
                  child: Text(
                    'Checkout',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: isMobile ? 12 : 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
