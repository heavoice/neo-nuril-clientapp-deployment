import 'package:flutter/material.dart';
import 'package:frontend/settings/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

class ProductCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String weight;
  final String oldPrice;
  final String newPrice;

  const ProductCard({
    super.key,
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

    double badgeSize = screenWidth >= 600 ? 40 : 20;
    double badgeMarginRight = screenWidth > 1210
        ? 80
        : screenWidth >= 600
            ? 40
            : 20;
    double badgeFontSize = screenWidth >= 600 ? 12 : 6;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1),
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
        padding: const EdgeInsets.symmetric(vertical: 48),
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
              height: screenWidth <= 734 ? 150 : null,
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: GoogleFonts.montserrat(
                color: AppColors.primaryColor,
                fontSize: screenWidth >= 600 ? 18 : 11,
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
            const SizedBox(height: 20),
            Container(
              width: 200,
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
            const SizedBox(height: 20),
            Container(
              width: screenWidth >= 600 ? 200 : 100,
              decoration: const BoxDecoration(
                color: AppColors.thirdColor,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: TextButton(
                onPressed: () {
                  // Fungsi Add to Cart (bisa dikembangkan)
                  debugPrint('Added $quantity item(s) to cart');
                },
                child: Text(
                  'Add to cart',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: screenWidth >= 600 ? null : 12,
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
