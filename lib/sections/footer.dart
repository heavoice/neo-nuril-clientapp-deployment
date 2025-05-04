import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/settings/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => Center(
        child: Container(
          color: AppColors.secondaryColor,
          width: double.infinity,
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.only(top: 60, bottom: 20),
            constraints: const BoxConstraints(maxWidth: 1400),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(image: Svg('assets/img/neo-nuril-white.svg')),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Product',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Benefactor',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Contact',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(width: 100),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Follow Us',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            Transform.translate(
                              offset: const Offset(-8, 0),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.instagram,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.facebook,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.twitter,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    '© 2024 NeoNuril All rights reserved.',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      tablet: (_) => const SizedBox.shrink(),
      mobile: (_) => const SizedBox.shrink(),
    );
  }
}
