import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../settings/constant.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.primaryColor, width: 1),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: Svg('assets/img/neo-nuril.svg'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(SolarIconsOutline.home, 'About'),
                _buildDrawerItem(SolarIconsOutline.settings, 'Product'),
                _buildDrawerItem(SolarIconsOutline.handHeart, 'Benefactor'),
                _buildDrawerItem(SolarIconsOutline.phone, 'Contact'),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                foregroundColor: AppColors.bgColor),
            onPressed: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                'Sign in',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
