import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class active_requests extends StatefulWidget {
  const active_requests({super.key});

  @override
  State<active_requests> createState() => _active_requestsState();
}

class _active_requestsState extends State<active_requests> {
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
                );
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
            "Active request",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: width * 0.08,
              color: colorPage.primaryColor,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
            padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: Container(
                width: width * 1,
                height: width * 2,
                child: Column(children: [
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("booking")
                          .where("status", isEqualTo: "Accept")
                          .where("id", isEqualTo: currentUserid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        var data = snapshot.data!.docs;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data!.isEmpty
                                ? SizedBox()
                                : ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: data.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        height: width * 0.27,
                                        width: width * 1,
                                        decoration: BoxDecoration(
                                            color: colorPage.secondaryColor,
                                            borderRadius: BorderRadius.circular(
                                                width * 0.015)),
                                        margin: EdgeInsets.all(width * 0.015),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.all(width * 0.025),
                                              child: Container(
                                                height: width * 0.25,
                                                width: width * 0.23,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            data[index]
                                                                ["images"]),
                                                        fit: BoxFit.cover),
                                                    // color: Colors.greenAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            width * 0.015)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.02,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    data[index]
                                                        ["pic_a_service"],
                                                    style: TextStyle(
                                                      // fontSize:14.36,
                                                      fontSize: width * 0.05,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: colorPage
                                                          .primaryColor,
                                                    )),
                                                Text(
                                                  data[index]
                                                      ["service_vehicle"],
                                                  style: TextStyle(
                                                      color:
                                                          colorPage.eigthColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: width * 0.0029,
                                                      fontSize: width * 0.036),
                                                ),
                                                Text(
                                                  data[index]["take_a_date"],
                                                  style: TextStyle(
                                                      color:
                                                          colorPage.eigthColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: width * 0.0029,
                                                      fontSize: width * 0.036),
                                                ),
                                                Row(
                                                  children: [
                                                    Text("------"),
                                                    Image.asset(
                                                      imagePage.circle,
                                                      width: width * 0.025,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.01,
                                                    ),
                                                    Text(
                                                        "Vehicle reached at center",
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.03,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: colorPage
                                                                .primaryColor)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Container();
                                    },
                                  ),
                          ],
                        );
                      }),
                ]))));
  }
}
