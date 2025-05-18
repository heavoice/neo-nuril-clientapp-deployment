import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../settings/constant.dart';

class CartDrawer extends StatelessWidget {
  const CartDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth >= 600 ? 400 : 200,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.primaryColor, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Image(
                      image: Svg(
                    'assets/img/neo-nuril.svg',
                  )),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(SolarIconsOutline.infoCircle, 'About'),
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
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: const Color.fromRGBO(0, 0, 0, 0),
      onTap: () {},
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryColor),
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
