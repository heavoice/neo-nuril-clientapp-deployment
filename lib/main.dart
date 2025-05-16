import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:neo_nuril_app/pages/cart_page.dart';
import './pages/home_page.dart';
import './providers/cart_provider.dart';

void main() {
  runApp(const NeoNuril());
}

class NeoNuril extends StatelessWidget {
  const NeoNuril({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Neo Nuril App',
        home: const HomePage(),
        routes: {
          '/home': (context) => const HomePage(),
          '/cart': (context) => const CartPage(),
        },
      ),
    );
  }
}
