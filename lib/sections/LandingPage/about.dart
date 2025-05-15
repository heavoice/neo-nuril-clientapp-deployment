import 'package:flutter/material.dart';
import 'package:neo_nuril_app/settings/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:responsive_builder/responsive_builder.dart';

class About extends StatelessWidget {
  About({super.key});
  final aboutKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Mobile/Tablet Layout
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
            sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/texture-mobile.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter),
              ),
              margin: const EdgeInsets.symmetric(vertical: 20),
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ScreenTypeLayout.builder(
                      mobile: (BuildContext context) => Image.asset(
                        'assets/img/product.png',
                        width: 300,
                        height: 300,
                      ),
                      tablet: (BuildContext context) => Image.asset(
                        'assets/img/product.png',
                        width: 420,
                        height: 420,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "We're now officially open!",
                    style: GoogleFonts.montserrat(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryColor),
                  ),
                  Text(
                    "Neo Nuril Aren - Premium Organic Palm Sugar Startup",
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Authentic Indonesian Palm Sugar, Crafted with Heritage Discover the pure sweetness of nature with our artisanal palm sugar, sustainably harvested from the lush coconut groves of Indonesia.",
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {},
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: AppColors.thirdColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Learn more',
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.bgColor),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            SolarIconsOutline.altArrowRight,
                            size: 12,
                            color: AppColors.bgColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }

        // Desktop Layout
        return Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/texture-web.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter),
            ),
            margin: const EdgeInsets.symmetric(vertical: 60),
            constraints: const BoxConstraints(maxWidth: 1400),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Flexible(
                  child: Image(
                      image: AssetImage('assets/img/product.png'),
                      fit: BoxFit.contain),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "We're now officially open!",
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryColor),
                      ),
                      Text(
                        "Neo Nuril Aren - Premium Organic Palm Sugar Startup",
                        style: GoogleFonts.montserrat(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Authentic Indonesian Palm Sugar, Crafted with Heritage Discover the pure sweetness of nature with our artisanal palm sugar, sustainably harvested from the lush coconut groves of Indonesia.",
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor),
                      ),
                      const SizedBox(height: 24),
                      InkWell(
                        onTap: () {},
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: AppColors.thirdColor,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Learn more',
                                style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.bgColor),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                SolarIconsOutline.altArrowRight,
                                size: 16,
                                color: AppColors.bgColor,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
