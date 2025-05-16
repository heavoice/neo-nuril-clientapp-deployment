import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeadCart extends StatefulWidget {
  const HeadCart({super.key});

  @override
  State<HeadCart> createState() => _HeadCartState();
}

bool isChecked = false;

class _HeadCartState extends State<HeadCart> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => Center(
        child: Container(
          margin: const EdgeInsets.only(top: 60),
          constraints: const BoxConstraints(maxWidth: 1400),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                    child: Text(
                      'Home',
                      style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    '/',
                    style: GoogleFonts.montserrat(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    onTap: () {},
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                    child: Text(
                      'Cart',
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Cart',
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 48,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value ?? false;
                                    });
                                  },
                                  activeColor: Colors.black,
                                  checkColor: Colors.white,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'Select All',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(9999)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(9999)),
                        ),
                        child: Text(
                          'Delete',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      // mobile & tablet
      mobile: (BuildContext context) => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 60),
          constraints: const BoxConstraints(maxWidth: 1400),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                    child: Text(
                      'Home',
                      style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    '/',
                    style: GoogleFonts.montserrat(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    onTap: () {},
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                    child: Text(
                      'Home',
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
