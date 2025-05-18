import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neo_nuril_app/providers/cart_provider.dart';
import 'package:neo_nuril_app/providers/checkbox_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeadCart extends StatefulWidget {
  const HeadCart({super.key});

  @override
  State<HeadCart> createState() => _HeadCartState();
}

class _HeadCartState extends State<HeadCart> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: _buildContent,
      tablet: _buildContent,
      mobile: _buildContent,
    );
  }

  Widget _buildContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isChecked = context.watch<CheckboxProvider>().selectAll;

    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        constraints: BoxConstraints(maxWidth: isMobile ? 600 : 1400),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            _buildBreadcrumb(),
            const SizedBox(height: 24),
            _buildTitle(isMobile),
            const SizedBox(height: 24),
            _buildCartHeader(isMobile, isChecked),
          ],
        ),
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Row(
      children: [
        _breadcrumbLink('Home', '/home', Colors.grey),
        const SizedBox(width: 16),
        _breadcrumbDivider(),
        const SizedBox(width: 16),
        _breadcrumbLink('Cart', null, Colors.black),
      ],
    );
  }

  Widget _breadcrumbLink(String label, String? route, Color color) {
    return InkWell(
      onTap: route != null ? () => Navigator.pushNamed(context, route) : null,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Text(
        label,
        style: GoogleFonts.montserrat(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _breadcrumbDivider() {
    return Text(
      '/',
      style: GoogleFonts.montserrat(
        color: Colors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildTitle(bool isMobile) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Your Cart',
        style: GoogleFonts.montserrat(
          color: Colors.black,
          fontSize: isMobile ? 32 : 48,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildCartHeader(bool isMobile, bool isChecked) {
    final cartItems = context.watch<CartProvider>().cartItems;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(isMobile ? 8 : 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  final allProductIds =
                      cartItems.map((item) => item.id).toList();
                  context
                      .read<CheckboxProvider>()
                      .toggleSelectAll(value ?? false, allProductIds);
                },
                activeColor: Colors.black,
                checkColor: Colors.white,
              ),
              if (!isMobile) const SizedBox(width: 12),
              Text(
                'Select All',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          _buildDeleteButton(isMobile),
        ],
      ),
    );
  }

  Widget _buildDeleteButton(bool isMobile) {
    return InkWell(
      onTap: () {
        final selectedIds = context.read<CheckboxProvider>().selectedProductIds;
        context.read<CartProvider>().removeSelectedItems(selectedIds.toSet());

        context.read<CheckboxProvider>().toggleSelectAll(false, []);
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(9999)),
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
          'Delete',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: isMobile ? 12 : 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
