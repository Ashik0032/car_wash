import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/location.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'main.dart';

class onSite extends StatefulWidget {
  const onSite({super.key});

  @override
  State<onSite> createState() => _onSiteState();
}

class _onSiteState extends State<onSite> {
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
              height: width * 2,
              width: width * 1,
              // color: Colors.red,
              child: IntroductionScreen(
                  showSkipButton: false,
                  showDoneButton: true,
                  showNextButton: true,
                  done: Text("Done",
                      style: TextStyle(
                          color: colorPage.fiftColor,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                      )),
                  onDone: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => location(),
                      ),
                      (route) => false,
                    );
                  },
                  next: Text("Skip",
                      style: TextStyle(
                          color: colorPage.fiftColor,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline)),
                  // skip: Text("skip"),
                  // onSkip: () {
                  // },

                  dotsDecorator: DotsDecorator(
                      activeColor: colorPage.primaryColor,
                      activeShape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.05),
                      ),
                      activeSize: Size(width * 0.1, width * 0.018)),
                  pages: [
                    PageViewModel(
                      titleWidget: Text(
                        "On site",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: width * 0.08,
                            color: colorPage.primaryColor),
                      ),
                      decoration: PageDecoration(
                          titlePadding: EdgeInsets.all(width * 0.03),
                          bodyAlignment: Alignment.center),
                      bodyWidget: Container(
                        height: width * 0.9,
                        width: width * 1,
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(imagePage.car1),
                            SizedBox(
                              height: width * 0.03,
                            ),
                            Text(
                              "You can  book  slot with location\nour service get your door step",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: width * 0.055,
                                color: colorPage.primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    PageViewModel(
                      titleWidget: Text(
                        "Self visit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: width * 0.08,
                            color: colorPage.primaryColor),
                      ),
                      decoration: PageDecoration(
                          titlePadding: EdgeInsets.all(width * 0.03),
                          bodyAlignment: Alignment.center),
                      bodyWidget: Container(
                        height: width * 0.9,
                        width: width * 1,
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(imagePage.car2),
                            SizedBox(
                              height: width * 0.03,
                            ),
                            Text(
                              "You can book a slot and go at\nworkstation",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: width * 0.055,
                                color: colorPage.primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    PageViewModel(
                      titleWidget: Text(
                        "Pickup and drop",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: width * 0.08,
                            color: colorPage.primaryColor),
                      ),
                      decoration: PageDecoration(
                          titlePadding: EdgeInsets.all(width * 0.03),
                          bodyAlignment: Alignment.center),
                      bodyWidget: Container(
                        height: width * 0.9,
                        width: width * 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(imagePage.car3),
                            SizedBox(
                              height: width * 0.03,
                            ),
                            Text(
                              "You can choose pickup & Drop\nfacility",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: width * 0.055,
                                color: colorPage.primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
