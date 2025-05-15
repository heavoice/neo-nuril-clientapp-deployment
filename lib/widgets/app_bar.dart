import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../settings/constant.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final Map<String, GlobalKey> sectionMap;

  const AppBarCustom({
    super.key,
    required this.sectionMap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      leadingWidth: double.infinity,
      leading: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 1400,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Image(
                      image: Svg('assets/img/neo-nuril.svg'),
                    ),
                  );
                },
              ),
              ResponsiveBuilder(builder: (context, sizingInformation) {
                if (sizingInformation.deviceScreenType !=
                        DeviceScreenType.mobile &&
                    sizingInformation.deviceScreenType !=
                        DeviceScreenType.tablet) {
                  return Row(
                    children: [
                      _buildNavItem('About'),
                      _buildNavItem('Product'),
                      _buildNavItem('Benefactor'),
                      _buildNavItem(
                          'Contact'), // Optional: tambahkan key-nya nanti
                    ],
                  );
                }
                return const SizedBox.shrink();
              }),
              Row(
                children: [
                  ScreenTypeLayout.builder(
                    desktop: (BuildContext context) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryColor,
                        foregroundColor: AppColors.bgColor,
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    mobile: (_) => const SizedBox.shrink(),
                    tablet: (_) => const SizedBox.shrink(),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(SolarIconsOutline.bag4),
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: const Color.fromRGBO(0, 0, 0, 0),
        onTap: () {
          final key = sectionMap[text];
          if (key?.currentContext != null) {
            Scrollable.ensureVisible(
              key!.currentContext!,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
