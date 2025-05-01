import 'package:flutter/material.dart';
import 'package:frontend/settings/constant.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SecondContent extends StatelessWidget {
  const SecondContent({super.key});

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
              margin: const EdgeInsets.symmetric(vertical: 20),
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ScreenTypeLayout.builder(
                      mobile: (BuildContext context) => Image.asset(
                        'assets/img/product2.png',
                        width: 300,
                        height: 300,
                      ),
                      tablet: (BuildContext context) => Image.asset(
                        'assets/img/product2.png',
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
                    hoverColor: Colors.transparent,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Read more',
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondaryColor),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          SolarIconsOutline.altArrowRight,
                          size: 12,
                          color: AppColors.secondaryColor,
                        ),
                      ],
                    ),
                  ),
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
                    alignment: Alignment(0, 0.2))),
            margin: const EdgeInsets.symmetric(vertical: 60),
            constraints: const BoxConstraints(maxWidth: 1400),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                        hoverColor: Colors.transparent,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Read more',
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondaryColor),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              SolarIconsOutline.altArrowRight,
                              size: 16,
                              color: AppColors.secondaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                const Flexible(
                  child: Image(
                      image: AssetImage('assets/img/product2.png'),
                      fit: BoxFit.contain),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
