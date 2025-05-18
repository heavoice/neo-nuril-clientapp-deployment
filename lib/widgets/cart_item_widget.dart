import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/cart_item.dart';
import '../providers/checkbox_provider.dart';
import '../settings/constant.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final item = widget.item;

    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: screenWidth < 600
          ? _buildMobileItem(context, item)
          : _buildDesktopItem(context, item),
    );
  }

  Widget _buildMobileItem(BuildContext context, CartItem item) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildCheckbox(item.id),
          Image.asset(
            item.imagePath,
            width: 40,
            height: 40,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image),
          ),
          const SizedBox(width: 8),
          _buildItemDetails(item, fontSize: 12),
        ],
      ),
    );
  }

  Widget _buildDesktopItem(BuildContext context, CartItem item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCheckbox(item.id),
          Image.asset(
            item.imagePath,
            width: 50,
            height: 50,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image),
          ),
          const SizedBox(width: 16),
          Expanded(child: _buildItemDetails(item, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildCheckbox(String productId) {
    return Checkbox(
      value: context.watch<CheckboxProvider>().isProductSelected(productId),
      onChanged: (_) {
        context.read<CheckboxProvider>().toggleProductSelection(productId);
      },
      activeColor: Colors.black,
      checkColor: Colors.white,
    );
  }

  Widget _buildItemDetails(CartItem item, {required double fontSize}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < 600
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize,
                ),
              ),
              Text(
                'Qty: ${item.quantity}',
                style: GoogleFonts.montserrat(fontSize: fontSize - 2),
              ),
              const SizedBox(height: 4),
              Text(
                '\$ ${item.oldPrice}',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize - 2,
                  color: AppColors.fourthColor,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.fourthColor,
                ),
              ),
              Text(
                '\$ ${(item.newPrice * item.quantity).toStringAsFixed(2)}',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize - 2,
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize,
                    ),
                  ),
                  Text(
                    'Qty: ${item.quantity}',
                    style: GoogleFonts.montserrat(fontSize: fontSize - 2),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Column(
                children: [
                  Text(
                    '\$ ${item.oldPrice}',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize - 2,
                      color: AppColors.fourthColor,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.fourthColor,
                    ),
                  ),
                  Text(
                    '\$ ${(item.newPrice * item.quantity).toStringAsFixed(2)}',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize - 2,
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
