import 'package:flutter/material.dart';
import 'package:neo_nuril_app/data/client_data.dart';
import 'package:neo_nuril_app/settings/constant.dart';
import 'package:neo_nuril_app/widgets/client_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:solar_icons/solar_icons.dart';

class Client extends StatefulWidget {
  Client({super.key});
  final clientKey = GlobalKey();

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {
  int startIndex = 0;
  late int itemsPerPage;

  List<Map<String, String>> getPaginatedData() {
    return client.skip(startIndex).take(itemsPerPage).toList();
  }

  @override
  Widget build(BuildContext context) {
    itemsPerPage = MediaQuery.of(context).size.width >= 1128 ? 2 : 1;
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
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: getPaginatedData()
                      .map((testimonial) => Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: clientCard(testimonial, context),
                          ))
                      .toList(),
                ),
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  (client.length / itemsPerPage).ceil(),
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: (startIndex == index * itemsPerPage) ? 30 : 15,
                        height: 10,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: AppColors.thirdColor,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.thirdColor,
                          ),
                          onPressed: () {
                            setState(() {
                              startIndex = index * itemsPerPage;
                            });
                          },
                          child: null,
                        ),
                      ),
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
      mobile: (BuildContext context) => Container(
        constraints: const BoxConstraints(maxWidth: 600),
        margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
        child: Column(
          children: [
            Column(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: getPaginatedData()
                        .map((testimonial) => Padding(
                              padding: const EdgeInsets.only(right: 32),
                              child: clientCard(testimonial, context),
                            ))
                        .toList(),
                  ),
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    (client.length / itemsPerPage).ceil(),
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          width: (startIndex == index * itemsPerPage) ? 30 : 15,
                          height: 10,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: AppColors.thirdColor,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.thirdColor,
                            ),
                            onPressed: () {
                              setState(() {
                                startIndex = index * itemsPerPage;
                              });
                            },
                            child: null,
                          ),
                        ),
                      );
                    },
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
