import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../settings/constant.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 80,
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.primaryColor, width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(
                  image: Svg('assets/img/neo-nuril.svg'),
                ),
                const SizedBox(width: 10),
                Text(
                  'Neo Nuril Aren',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(SolarIconsOutline.home, 'About'),
          _buildDrawerItem(SolarIconsOutline.settings, 'Product'),
          _buildDrawerItem(SolarIconsOutline.logout, 'Benefactor'),
          _buildDrawerItem(SolarIconsOutline.logout, 'Contact'),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
