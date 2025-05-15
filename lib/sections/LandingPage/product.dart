import 'package:flutter/material.dart';
import 'package:neo_nuril_app/data/product_data.dart';
import 'package:neo_nuril_app/settings/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:solar_icons/solar_icons.dart';

class Product extends StatefulWidget {
  Product({super.key});
  final productKey = GlobalKey();

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final PageController _pageController = PageController(viewportFraction: 0.85);

  void _goToPrevious() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _goToNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  Widget _buildContent(BuildContext context, SizingInformation sizingInfo) {
    double width = sizingInfo.screenSize.width;
    int itemsPerPage = width > 1270
        ? 3
        : width > 734
            ? 2
            : 1;
    double itemWidth = width > 1270
        ? 294
        : width > 734
            ? 220
            : 143;
    double height = width > 1270
        ? 713
        : width > 734
            ? 650
            : 492;

    return Container(
      margin:
          EdgeInsets.symmetric(vertical: width > 734 ? 60 : 24, horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 1400),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Here are some of the exceptional products we proudly offer.',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {},
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'All products',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.fourthColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    SolarIconsOutline.altArrowRight,
                    size: 12,
                    color: AppColors.fourthColor,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: width > 734 ? null : 25,
                height: width > 734 ? null : 25,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.thirdColor,
                ),
                child: IconButton(
                  padding: width > 734 ? null : EdgeInsets.zero,
                  iconSize: width > 734 ? null : 16,
                  icon: const Icon(SolarIconsOutline.altArrowLeft),
                  color: Colors.white,
                  onPressed: _goToPrevious,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: height,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: (products.length / itemsPerPage).ceil(),
                    itemBuilder: (context, index) {
                      int startIndex = index * itemsPerPage;
                      int endIndex =
                          (startIndex + itemsPerPage) > products.length
                              ? products.length
                              : (startIndex + itemsPerPage);

                      return Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            endIndex - startIndex,
                            (i) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: SizedBox(
                                  width: itemWidth,
                                  child: products[startIndex + i],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                width: width > 734 ? null : 25,
                height: width > 734 ? null : 25,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.thirdColor,
                ),
                child: IconButton(
                  padding: width > 734 ? null : EdgeInsets.zero,
                  iconSize: width > 734 ? null : 16,
                  icon: const Icon(SolarIconsOutline.altArrowRight),
                  color: Colors.white,
                  onPressed: _goToNext,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Center(child: _buildContent(context, sizingInfo));
      },
    );
  }
}
