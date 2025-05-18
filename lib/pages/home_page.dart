// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:neo_nuril_app/sections/LandingPage/product.dart';
import 'dart:html' as html;
import '../widgets/app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../sections/LandingPage/about.dart';
import '../sections/LandingPage/footer.dart';
import '../sections/LandingPage/second_content.dart';
import '../sections/LandingPage/client.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    html.document.title = 'Neo Nuril App - Homepage';
    final GlobalKey aboutKey = GlobalKey();
    final GlobalKey productKey = GlobalKey();
    final GlobalKey clientKey = GlobalKey();
    final GlobalKey contactKey =
        GlobalKey(); // Optional jika ada section Contact

    final sectionMap = {
      'About': aboutKey,
      'Product': productKey,
      'Benefactor': clientKey,
      'Contact': contactKey, // Optional
    };

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileOrTablet = screenWidth < 1000;

    return Scaffold(
      appBar: AppBarCustom(sectionMap: sectionMap),
      drawer: isMobileOrTablet ? CustomDrawer(sectionMap: sectionMap) : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            About(key: aboutKey),
            const SecondContent(),
            Product(key: productKey),
            Client(key: clientKey),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
