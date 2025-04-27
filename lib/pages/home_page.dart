import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/custom_drawer.dart';
import '../components/content.dart';
import '../components/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: const CustomDrawer(),
      body: ListView(
        children: const [
          Content(),
          Product(),
        ],
      ),
    );
  }
}
