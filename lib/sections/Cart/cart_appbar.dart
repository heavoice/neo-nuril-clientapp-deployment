import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../settings/constant.dart';

class CartAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppbar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                  return Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (screenWidth < 1000) {
                            Scaffold.of(context).openDrawer();
                          } else {
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        icon: const Image(
                          image: Svg('assets/img/neo-nuril.svg'),
                        ),
                      ),
                    ],
                  );
                },
              ),
              ResponsiveBuilder(builder: (context, sizingInformation) {
                if (sizingInformation.deviceScreenType !=
                        DeviceScreenType.mobile &&
                    sizingInformation.deviceScreenType !=
                        DeviceScreenType.tablet) {
                  return const Row(
                    children: [],
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
