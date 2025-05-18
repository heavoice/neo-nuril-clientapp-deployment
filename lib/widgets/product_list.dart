import 'package:flutter/material.dart';
import 'package:neo_nuril_app/settings/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:neo_nuril_app/providers/cart_provider.dart';
import 'package:neo_nuril_app/models/cart_item.dart';

class ProductCard extends StatefulWidget {
  final String id;
  final String imagePath;
  final String title;
  final String weight;
  final double oldPrice;
  final double newPrice;

  const ProductCard({
    super.key,
    required this.id,
    required this.imagePath,
    required this.title,
    required this.weight,
    required this.oldPrice,
    required this.newPrice,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 1;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double badgeSize = screenWidth >= 734 ? 40 : 20;
    double badgeMarginRight = screenWidth > 1210
        ? 80
        : screenWidth >= 734
            ? 40
            : 20;
    double badgeFontSize = screenWidth >= 734 ? 12 : 6;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: badgeSize,
                height: badgeSize,
                margin: EdgeInsets.only(right: badgeMarginRight),
                decoration: const BoxDecoration(
                  color: AppColors.fourthColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '20%',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: badgeFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Image.asset(
              widget.imagePath,
              width: screenWidth <= 734 ? 150 : null,
              height: screenWidth <= 734
                  ? 130
                  : screenWidth <= 734
                      ? 150
                      : null,
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: GoogleFonts.montserrat(
                color: AppColors.primaryColor,
                fontSize: screenWidth >= 734 ? 18 : 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              widget.weight,
              style: GoogleFonts.montserrat(
                color: AppColors.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$ ${widget.oldPrice}",
                  style: GoogleFonts.montserrat(
                    color: AppColors.fourthColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: AppColors.fourthColor,
                  ),
                ),
                const SizedBox(width: 20, height: 40),
                Text(
                  '\$ ${widget.newPrice}',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth >= 734 ? 10 : 20),
            Container(
              width: screenWidth > 734 ? 200 : null,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(SolarIconsOutline.minusCircle),
                    onPressed: _decrementQuantity,
                  ),
                  Text(
                    '$quantity',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(SolarIconsOutline.addCircle),
                    onPressed: _incrementQuantity,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenWidth >= 734 ? 10 : 20),
            Container(
              width: screenWidth >= 734 ? 200 : 100,
              decoration: const BoxDecoration(
                color: AppColors.thirdColor,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: TextButton(
                onPressed: () {
                  final cartItem = CartItem(
                      id: widget.id,
                      title: widget.title,
                      imagePath: widget.imagePath,
                      quantity: quantity,
                      oldPrice: widget.oldPrice,
                      newPrice: widget.newPrice);

                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(cartItem);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${widget.title} added to cart'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Text(
                  'Add to cart',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: screenWidth >= 734 ? null : 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
