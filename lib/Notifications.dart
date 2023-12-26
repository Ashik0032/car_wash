import 'package:car_wash/color_page.dart';
import 'package:car_wash/home.dart';
import 'package:car_wash/image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class notifications extends StatefulWidget {
  const notifications({super.key});

  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  List set=[
    "The prowash of maruthi-6H had\ncompleted successfully",
    "The prowash of maruthi-6H  have\nsome terrible",
    "The prowash of maruthi-6H had\ncompleted successfully",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorPage.nineColor,
        appBar: AppBar(
          backgroundColor: colorPage.nineColor,
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.all(width * 0.043),
            child: InkWell(
              onTap: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => home(),
                    ));
              },
              child: Container(
                height: width * 0.03,
                width: width * 0.03,
                child: SvgPicture.asset(
                  imagePage.arrow,
                ),
              ),
            ),
          ),
          title: Text(
            "Notifications",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: width * 0.08,
              color: colorPage.primaryColor,
            ),
          ),
          elevation: 0,
        ),
        body: Container(
            height: width * 2.33,
            width: width * 1,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today",
                            style: TextStyle(
                                color: colorPage.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.052),
                          ),
                          Text("Clear all",
                              style: TextStyle(
                                fontSize: width * 0.036,
                                fontWeight: FontWeight.w500,
                                color: colorPage.tenColor,
                              )),
                        ],
                      ),
                    ),
                    Dismissible(
                      key: UniqueKey(),
                      child: Container(
                        height: width*0.85,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: width*0.25,
                              width: width*1,
                              margin: EdgeInsets.only(bottom: width*0.03),
                              color: colorPage.secondaryColor,
                              child: Center(
                                child: Text(set[index],
                                    style: TextStyle(
                                        fontSize: width*0.05,
                                        fontWeight: FontWeight.w400,
                                        color: colorPage.a14
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Yesterday",
                            style: TextStyle(
                                color: colorPage.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.052),
                          ),
                          Text("Clear all",
                              style: TextStyle(
                                fontSize: width * 0.036,
                                fontWeight: FontWeight.w500,
                                color: colorPage.tenColor,
                              )),
                        ],
                      ),
                    ),
                    Dismissible(
                      key: UniqueKey(),
                      child: Container(
                        height: width*0.85,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: width*0.25,
                              width: width*1,
                              margin: EdgeInsets.only(bottom: width*0.03),
                              color: colorPage.secondaryColor,
                              child: Center(
                                child: Text("The prowash of maruthi-6H had\ncompleted successfully",
                                    style: TextStyle(
                                        fontSize: width*0.05,
                                        fontWeight: FontWeight.w400,
                                        color: colorPage.a14
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
