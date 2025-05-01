import 'package:flutter/material.dart';
import 'package:frontend/data/product_data.dart';
import 'package:frontend/settings/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:solar_icons/solar_icons.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  void _goToPrevious() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() => _currentPage--);
    }
  }

  void _goToNext() {
    if (_currentPage < products.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() => _currentPage++);
    }
  }

  final List<Widget> products = [
    const ProductCard(
      imagePath: 'assets/img/product3.png',
      title: 'Unicorn Blood Dark',
      weight: '500 g',
      oldPrice: '14.99',
      newPrice: '10.49',
    ),
    const ProductCard(
      imagePath: 'assets/img/product4.png',
      title: 'Ethiopian Yirgacheffe',
      weight: '500 g',
      oldPrice: '14.99',
      newPrice: '10.49',
    ),
    const ProductCard(
      imagePath: 'assets/img/product5.png',
      title: 'Cold Brew Blend',
      weight: '500 g',
      oldPrice: '14.99',
      newPrice: '10.49',
    ),
    const ProductCard(
      imagePath: 'assets/img/product5.png',
      title: 'Cold Brew Blend',
      weight: '500 g',
      oldPrice: '14.99',
      newPrice: '10.49',
    ),
    const ProductCard(
      imagePath: 'assets/img/product5.png',
      title: 'Cold Brew Blend',
      weight: '500 g',
      oldPrice: '14.99',
      newPrice: '10.49',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 60),
          constraints: const BoxConstraints(maxWidth: 1400),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Here are some of the exceptional products we proudly offer.',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 12),
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
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    // Tombol kiri
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.thirdColor,
                      ),
                      child: IconButton(
                        icon: const Icon(SolarIconsOutline.altArrowLeft),
                        color: Colors.white,
                        onPressed: _goToPrevious,
                      ),
                    ),

                    // Carousel
                    Expanded(
                      child: SizedBox(
                        height: 713,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: (products.length /
                                  (MediaQuery.of(context).size.width > 1210
                                      ? 3
                                      : 2))
                              .ceil(),
                          itemBuilder: (context, index) {
                            int itemsPerPage =
                                MediaQuery.of(context).size.width > 1270
                                    ? 3
                                    : 2;
                            int startIndex = index * itemsPerPage;
                            int endIndex =
                                (startIndex + itemsPerPage) > products.length
                                    ? products.length
                                    : (startIndex + itemsPerPage);

                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  endIndex - startIndex,
                                  (i) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: SizedBox(
                                        width: 294,
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

                    // Tombol kanan
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.thirdColor,
                      ),
                      child: IconButton(
                        icon: const Icon(SolarIconsOutline.altArrowRight),
                        color: Colors.white,
                        onPressed: _goToNext,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      tablet: (BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
        constraints: const BoxConstraints(maxWidth: 600),
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
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {},
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: const Color.fromRGBO(0, 0, 0, 0),
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
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  // Tombol kiri
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.thirdColor,
                    ),
                    child: IconButton(
                      icon: const Icon(SolarIconsOutline.altArrowLeft),
                      color: Colors.white,
                      onPressed: _goToPrevious,
                    ),
                  ),

                  // Carousel
                  Expanded(
                    child: SizedBox(
                      height:
                          MediaQuery.of(context).size.width > 734 ? 713 : 550,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: (products.length /
                                (MediaQuery.of(context).size.width > 734
                                    ? 2
                                    : 1))
                            .ceil(),
                        itemBuilder: (context, index) {
                          int itemsPerPage =
                              MediaQuery.of(context).size.width > 734 ? 2 : 1;
                          int startIndex = index * itemsPerPage;
                          int endIndex =
                              (startIndex + itemsPerPage) > products.length
                                  ? products.length
                                  : (startIndex + itemsPerPage);

                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                endIndex - startIndex,
                                (i) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: SizedBox(
                                      width: 220,
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

                  // Tombol kanan
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.thirdColor,
                    ),
                    child: IconButton(
                      icon: const Icon(SolarIconsOutline.altArrowRight),
                      color: Colors.white,
                      onPressed: _goToNext,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      mobile: (BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
        constraints: const BoxConstraints(maxWidth: 600),
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
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {},
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: const Color.fromRGBO(0, 0, 0, 0),
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
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  // Tombol kiri
                  Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.thirdColor,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 16,
                      icon: const Icon(SolarIconsOutline.altArrowLeft),
                      color: Colors.white,
                      onPressed: _goToPrevious,
                    ),
                  ),

                  // Carousel
                  Expanded(
                    child: SizedBox(
                      height: 515,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: (products.length /
                                (MediaQuery.of(context).size.width > 734
                                    ? 2
                                    : 1))
                            .ceil(),
                        itemBuilder: (context, index) {
                          int itemsPerPage =
                              MediaQuery.of(context).size.width > 734 ? 2 : 1;
                          int startIndex = index * itemsPerPage;
                          int endIndex =
                              (startIndex + itemsPerPage) > products.length
                                  ? products.length
                                  : (startIndex + itemsPerPage);

                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                endIndex - startIndex,
                                (i) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: SizedBox(
                                      width: 143,
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

                  // Tombol kanan
                  Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.thirdColor,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 16,
                      icon: const Icon(SolarIconsOutline.altArrowRight),
                      color: Colors.white,
                      onPressed: _goToNext,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
