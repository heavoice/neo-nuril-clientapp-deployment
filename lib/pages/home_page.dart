import 'package:flutter/material.dart';
import 'package:frontend/components/product.dart';
import '../components/app_bar.dart';
import '../components/custom_drawer.dart';
import '../components/content.dart';
import '../components/second_content.dart';
import '../components/client.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: const CustomDrawer(),
      body: ListView(
        children: const [Content(), SecondContent(), Product(), Client()],
      ),
    );
  }
}
