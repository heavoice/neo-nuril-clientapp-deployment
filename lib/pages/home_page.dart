import 'package:flutter/material.dart';
import 'package:frontend/sections/product.dart';
import '../sections/app_bar.dart';
import '../sections/custom_drawer.dart';
import '../sections/content.dart';
import '../sections/footer.dart';
import '../sections/second_content.dart';
import '../sections/client.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobileOrTablet = screenWidth < 1000;

    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: isMobileOrTablet ? const CustomDrawer() : null,
      body: ListView(
        children: const [
          Content(),
          SecondContent(),
          Product(),
          Client(),
          Footer(),
        ],
      ),
    );
  }
}
