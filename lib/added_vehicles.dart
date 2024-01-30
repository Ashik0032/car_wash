import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class added_vehicles extends StatefulWidget {
  const added_vehicles({super.key});

  @override
  State<added_vehicles> createState() => _added_vehiclesState();
}

class _added_vehiclesState extends State<added_vehicles> {
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
          "Added vehicles",
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
          child: Column(
            children: [
              StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("carwash")
                      .doc(currentUserid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    var data = snapshot.data;
                    Map<String, dynamic> DataMap =
                        data?.data() as Map<String, dynamic>;
                    List vehicles = DataMap['vehicles'];
                    return Expanded(
                      child:vehicles!.isEmpty? SizedBox() :

                      ListView.builder(
                        itemCount: vehicles.length,
                          itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: width * 0.27,
                          width: width * 1,
                          decoration: BoxDecoration(
                              color: colorPage.secondaryColor,
                              borderRadius: BorderRadius.circular(width * 0.015)),
                          margin: EdgeInsets.all(width * 0.015),
                          child: Padding(
                            padding: EdgeInsets.all(width * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "vehicle  :  ${vehicles[index]["vehicle"]}",
                                  style: TextStyle(
                                      color: colorPage.primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.04),
                                ),
                                Text(
                                  "Model  :  ${vehicles[index]["model"]}",
                                  style: TextStyle(
                                      color: colorPage.primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.04),
                                ),
                                Text(
                                    "Reg number  :  ${vehicles[index]["Reg.number"]}",
                                    style: TextStyle(
                                      // fontSize:14.36,
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w600,
                                      color: colorPage.primaryColor,
                                    )),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
