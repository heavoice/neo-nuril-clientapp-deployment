// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:neo_nuril_app/sections/Cart/cart_appbar.dart';
import 'package:neo_nuril_app/sections/Cart/cart_drawer.dart';
import 'package:neo_nuril_app/sections/Cart/cart_list.dart';
import 'package:neo_nuril_app/sections/Cart/head_cart.dart';
import 'package:neo_nuril_app/widgets/checkout_navigation.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    html.document.title = 'Neo Nuril App - Cart Screen';
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileOrTablet = screenWidth < 1000;
    return Scaffold(
      appBar: const CartAppbar(),
      drawer: isMobileOrTablet ? const CartDrawer() : null,
      body: const SingleChildScrollView(
        child: Column(
          children: [HeadCart(), CartList()],
        ),
      ),
      bottomNavigationBar: const CheckoutNavigation(),
    );
  }
}
