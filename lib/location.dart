import 'package:car_wash/bottom_bar.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/home/screens/home.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';

class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: width * 2.1,
              width: width * 1,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "We want your\nlocation",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: width * 0.08,
                        color: colorPage.primaryColor),
                  ),
                  Container(
                    height: width * 1,
                    // color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(imagePage.car4),
                        Text(
                          "We make yours shine, enable your\nlocation to make it easy",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.055,
                            color: colorPage.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: colorPage.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(width * 0.05),
                              topRight: Radius.circular(width * 0.05)),
                        ),
                        context: context,
                        builder: (context) {
                          return Container(
                            height: width * 0.9,
                            width: width * 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: width * 0.35,
                                    width: width * 0.35,
                                    child: Lottie.asset(imagePage.lottie)),
                                Text(
                                  "Location saved",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: width * 0.08,
                                      color: colorPage.primaryColor),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: width * 0.13,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                          color: colorPage.primaryColor,
                          borderRadius: BorderRadius.circular(width * 1)),
                      child: Center(
                        child: Text("Enable",
                            style: TextStyle(
                                color: colorPage.secondaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.05)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bottom_bar(),
                          ));
                    },
                    child: Container(
                      height: width * 0.13,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                          color: colorPage.primaryColor,
                          borderRadius: BorderRadius.circular(width * 1)),
                      child: Center(
                        child: Text("Skip",
                            style: TextStyle(
                                color: colorPage.secondaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.05)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
