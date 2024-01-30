import 'package:car_wash/Confirmation.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/image_page.dart';
import 'package:car_wash/take_a_slot.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class orderDetails extends StatefulWidget {
  const orderDetails({super.key});

  @override
  State<orderDetails> createState() => _orderDetailsState();
}

class _orderDetailsState extends State<orderDetails> {
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
                Navigator.pop(context);
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
            "Order details",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: width * 0.08,
              color: colorPage.primaryColor,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
            padding: EdgeInsets.only(
                 left: width * 0.05, right: width * 0.05,),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("booking").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                var data1 = snapshot.data!.docs;
                return Container(
                    height: width * 2.33,
                    width: width * 1,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: width * 0.52,
                          width: width * 1,
                          decoration: BoxDecoration(
                            color: colorPage.primaryColor,
                            image: DecorationImage(image: NetworkImage(data1[0]["images"]),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(width*0.02)
                          ),

                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection("carwash").doc(currentUserid).snapshots(),

                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            }
                            var data = snapshot.data;
                            Map<String, dynamic> DataMap =
                            data?.data() as Map<String, dynamic>;
                            List vehicles = DataMap['vehicles'];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: width*0.03,),
                                Text(
                                  "Vehicle",
                                  style: TextStyle(
                                    color: colorPage.primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.052,
                                  ),
                                ),
                                Text("Vehicle                              :    ${vehicles[0]["vehicle"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width*0.05,
                                  color: colorPage.a14,
                                ),),
                                Text("Model                                :    ${vehicles[0]["model"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width*0.05,
                                  color: colorPage.a14,
                                ),),
                                Text("Reg.number                   :    ${vehicles[0]["Reg.number"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width*0.05,
                                  color: colorPage.a14,
                                ),),
                                Text("Client                                 :    ${vehicles[0]["client"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width*0.05,
                                  color: colorPage.a14,
                                ),),
                                Text("Phone                                :    +91  ${data!["phone_number"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width*0.05,
                                  color: colorPage.a14,
                                ),),
                                SizedBox(height: width*0.03,),
                              ],
                            );
                          }
                        ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Service details",
                          style: TextStyle(
                            color: colorPage.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.052,
                          ),
                        ),
                        Text("service                              :    ${data1[0]["pic_a_service"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: width*0.05,
                            color: colorPage.a14,
                          ),),
                        SizedBox(height: width*0.03,),
                        Text(
                          "Slot date",
                          style: TextStyle(
                            color: colorPage.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.052,
                          ),
                        ),
                        Text("Date                                    :     ${data1[0]["take_a_date"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: width*0.05,
                            color: colorPage.a14,
                          ),),
                        Text("Time                                    :   ${data1[0]["pic_slot"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: width*0.05,
                            color: colorPage.a14,
                          ),),
                        SizedBox(height: width*0.03,),
                        Text(
                          "Payment  details",
                          style: TextStyle(
                            color: colorPage.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.052,
                          ),
                        ),
                        Text("Payment method       :    ${data1[0]["payment_method"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: width*0.05,
                            color: colorPage.a14,
                          ),),
                        Text("Payment status            :    Payment completed",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: width*0.049,
                            color: colorPage.a14,
                          ),),
                      ],
                    ),
                      ],
                    ));
              }
            )));
  }
}
